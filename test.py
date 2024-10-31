from bs4 import BeautifulSoup
import requests
import pandas as pd

def scrape_cheapest_winter_hotels():
    url = 'https://www.booking.com/searchresults.en-gb.html?ss=United+States&checkin_monthday=1&checkin_month=12&checkin_year=2023&checkout_monthday=31&checkout_month=12&checkout_year=2023&group_adults=1&no_rooms=1'
    headers = {
        'User-Agent': 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.3'
    }
    
    response = requests.get(url, headers=headers)
    soup = BeautifulSoup(response.content, 'html.parser')

    hotels = []
    
    # Find hotel listings
    for hotel in soup.find_all('div', class_='sr_property_block'):
        name = hotel.find('span', class_='sr-hotel__name').text.strip()
        price = hotel.find('div', class_='bui-price-display__value').text.strip()
        hotels.append({'name': name, 'price': price})
    
    return hotels

if __name__ == '__main__':
    cheapest_hotels = scrape_cheapest_winter_hotels()
    for hotel in cheapest_hotels:
        print(f"Hotel Name: {hotel['name']}, Price: {hotel['price']}")