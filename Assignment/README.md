# Web Scraper
> Author: Ross Curley\
> Year: 2021
## Set-Up:
    chmod +x Secrets/passwordCheck.sh
    chmod +x Secrets/setPassword.sh
    chmod +x Tests/TestScraper.sh
    chmod +x Scraper.sh
    chmod +x ScraperMenu.sh
    chmod +x Search.sh

    pip install bs4

## Running the Script
    In the Assignment Directory Run ./ScraperMenu.sh
    Default password = 'password'

## Custom Search Format
### Scope:
    Government = G
    Individuals and Families = I
    Small and medium businesses = S
    Large businesses and infrastructure = L
### Title option:
    EQUAL
    WORD
    ALL
### Title:
    enter search terms for title
### Content options:
    WORD
    ALL
### Content:
    enter search terms for content
### Sort by:
    DATE
    TITLE 
### Sort order:
    ASC
    DESC
### Line format:
    [G|I|S|L],[EQUAL|WORD|ALL],['title'],[WORD|ALL],['body'],[DATE|TITLE],[ASC|DESC]

### Any of these options can also be left blank