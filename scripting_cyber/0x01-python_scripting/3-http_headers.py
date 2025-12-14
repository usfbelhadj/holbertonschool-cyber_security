#!/usr/bin/env python3
import requests

def get_http_headers(url):
    """
    Retrieves HTTP response headers from a website.
    
    Args:
        url (str): The URL of the website to query
        
    Returns:
        dict: A dictionary containing status_code and headers
              Format: {'status_code': int, 'headers': dict}
              Returns None if the request fails
    """
    try:
        response = requests.get(url)
        return {
            'status_code': response.status_code,
            'headers': dict(response.headers)
        }
    except requests.exceptions.RequestException as e:
        return None
