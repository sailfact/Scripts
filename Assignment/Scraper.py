#!/bin/env python3

import bs4
import sys
 
from urllib.request import urlopen
from bs4 import BeautifulSoup


if __name__ == "__main__":
    if len(sys.argv) < 3:
        line = sys.argv[1].split(',')
        filename = "alerts{0}.csv".format(sys.argv[2])
        url = "https://www.cyber.gov.au/acsc/view-all-content/alerts{0}?title_op={1}&title={2}&body_value_op={3}&body_value={4}&sort_by={5}&sort_order={6}".format(
            get_scope(line[0]),
            get_title_op(line[1]),
            get_title(line[2]),
            get_body_op(line[3]),
            get_body(line[4]),
            get_sort(line[5]),
            get_order(line[6])
        )
    else:
        url = 'https://www.cyber.gov.au/acsc/view-all-content/alerts'
        filename = "alerts.csv"

    # Opening connection to website reading html into variable
    client = urlopen(url)
    html=client.read()
    client.close() # close connection

    # Running Beautiful Soup
    soup = BeautifulSoup(html, "html.parser")
    containers = soup.findAll("div", {"class":"views-row"})

    # Open csv file
    f = open(filename, "w")
    headers = "Alert Status, Date, Title, Summary"
    f.write(headers)

    for container in containers[1:]:
        # skip first row as its blank
        date_container = container.findAll("p",{"class":"acsc-date"})
        title_container = container.findAll("p",{"class":"acsc-title"})
        summary_container = container.findAll("p",{"class":"acsc-summary"})

        date, alert = date_container[0].text.split(" - ") # get date and alert
        alert = alert.split(": ")[1]
        title = title_container[0].text
        summary = summary_container[0].text

        print("{0}, {1}, {2}, {3}".format(alert, date, title, summary))

        f.write("{0}, {1}, {2}, {3}".format(alert, date, title, summary))

def get_scope(scope):
    if scope == "g":
        ret = "/government"
    elif scope == "i":
        ret = "/individuals-and-families"
    elif scope == "s":
        ret = "/small-and-medium-businesses"
    elif scope == "l":
        ret = "/large-organisations-and-infrastructure"
    else: 
        ret = ""

    return ret 
    
def get_title_op(line):
    return 
def get_title(line):
    return 
def get_body_op(line):
    return 
def get_body(line):
    return
def get_sort(line):
    """field_date_user_updated_value"""
    """title"""
    return
def get_order(line):
    return