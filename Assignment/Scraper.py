#!/bin/env python3

import bs4
import sys
 
from urllib.request import urlopen
from urllib.error import HTTPError
from bs4 import BeautifulSoup

"""
Determines url string from given inputs
Scope
Title Option
Title Search
Content Options
Content Search
Sort By
Sort Order

[G|I|S|L],[EQUAL|WORD|ALL],['title'],[WORD|ALL],['body'],[DATE|TITLE],[ASC|DESC]
"""
def get_scope(scope):
    if scope == "G":
        ret = "/government"
    elif scope == "I":
        ret = "/individuals-and-families"
    elif scope == "S":
        ret = "/small-and-medium-businesses"
    elif scope == "L":
        ret = "/large-organisations-and-infrastructure"
    else: 
        ret = ""

    return ret 
    
def get_title_op(op):
    if op == "EQUAL":
        ret = "%3D"
    elif op == "ALL":
        ret = "allwords"
    else:
        # Default to word
        ret = "word"

    return ret 

def get_title(title):
    return str(title)

def get_body_op(op):
    if op == "ALL":
        ret = "allwords"
    else:
        # Default to word
        ret = "word"
    return ret

def get_body(body):
    return str(body)
    
def get_sort(sort):
    if sort == "DATE" or sort == "TITLE":
        return sort 
    else:
        # Default to DATE
        return "field_date_user_updated_value"

def get_order(order):
    if order == "ASC" or order == "DESC":
        return order
    else:
        # Default to DESC
        return "DESC" 

def get_url(line):
    try:
        url = "https://www.cyber.gov.au/acsc/view-all-content/alerts{0}?title_op={1}&title={2}&body_value_op={3}&body_value={4}&sort_by={5}&sort_order={6}".format(
            get_scope(line[0]),
            get_title_op(line[1]),
            get_title(line[2]),
            get_body_op(line[3]),
            get_body(line[4]),
            get_sort(line[5]),
            get_order(line[6])
        )
    except IndexError as e:
        # Handle any Index related errors
        print(e)
        exit(1)

if __name__ == "__main__":
    filename = "alerts.csv"
    page = 0
    if len(sys.argv) == 2:
        url = get_url(sys.argv[1].split(','))
    else:
        url = 'https://www.cyber.gov.au/acsc/view-all-content/alerts?title_op=word&title=&body_value_op=word&body_value=&sort_by=field_date_user_updated_value&sort_order=DESC'
    
    try:
        # Opening connection to website reading html into variable
        client = urlopen(url)
        html=client.read()
        client.close() # close connection

        # Running Beautiful Soup
        soup = BeautifulSoup(html, "html.parser")
        containers = soup.findAll("div", {"class":"views-row"})
    except HTTPError as e:
        # Handle any HTTP errors that may occur
        print(e)
        exit(1)

    try:    
        # Open csv file
        f = open(filename, "w")

        for container in containers[1:]:
            # skip first row as its blank
            date_container = container.findAll("p",{"class":"acsc-date"})
            title_container = container.findAll("p",{"class":"acsc-title"})
            summary_container = container.findAll("p",{"class":"acsc-summary"})

            date, alert = date_container[0].text.split(" - ") # get date and alert
            alert = alert.split(": ")[1]
            title = title_container[0].text
            summary = summary_container[0].text

            f.write("{0}, {1}, {2}, {3}\n".format(alert, date, title, summary))
        f.close()
    except IOError as e:
        # Handle any IO errors that may occur
        print(e)
        exit(1)

    exit(0)