#!/usr/bin/env python3
import requests
from bs4 import BeautifulSoup

def download_page(url):
    """
    Downloads a web page and returns its formatted HTML content.
    
    Args:
        url (str): The URL of the web page to download
        
    Returns:
        str: Formatted HTML content of the web page
    """
    try:
        response = requests.get(url)
        response.raise_for_status()  # Raise an exception for bad status codes
        
        soup = BeautifulSoup(response.text, 'html.parser')
        formatted_html = soup.prettify()
        
        return formatted_html
    except requests.exceptions.RequestException as e:
        return f"Error downloading page: {e}"

