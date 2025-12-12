#!/usr/bin/env python3
import socket

def resolve_domain_to_ipv4(domain_name):
    """
    Resolves a domain name to its IPv4 address using the socket library.
    
    Args:
        domain_name (str): The domain to resolve (e.g., 'example.com')
        
    Returns:
        str: The IPv4 address or an error message.
    """
    try:
        # socket.gethostbyname() queries the DNS for the A record
        ip_address = socket.gethostbyname(domain_name)
        return ip_address
    except socket.gaierror:
        return None
    except Exception as e:
        return f"Error: {e}"