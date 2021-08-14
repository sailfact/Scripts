#!/bin/env python3

import bs4
 
from urllib.request import urlopen
from bs4 import BeautifulSoup

# Opening connection to website reading html into variable
url = 'https://www.cyber.gov.au/acsc/view-all-content/alerts'
client = urlopen(url)
html=client.read()
client.close() # close connection

# Running Beautiful Soup
soup = BeautifulSoup(html, "html.parser")
containers = soup.findAll("div", {"class":"views-row"})

# Open csv file
filename = "alerts.csv"
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