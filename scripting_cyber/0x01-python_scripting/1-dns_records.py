#!/usr/bin/env python3
import dns.resolver
import sys

def query_dns_records(domain_name):
    """
    Queries multiple DNS record types for a given domain.
    
    Retrieves A, AAAA, MX, NS, TXT, and SOA records using dns.resolver.resolve().
    
    Args:
        domain_name (str): The domain to query (e.g., 'example.com')
        
    Returns:
        dict: A dictionary containing DNS resolver answers organized by record type.
              Format: {'A': answers_object, 'AAAA': answers_object, ...}
              Only includes record types that were successfully queried.
    """
    record_types = ['A', 'AAAA', 'MX', 'NS', 'TXT', 'SOA']
    results = {}
    
    for record_type in record_types:
        try:
            answers = dns.resolver.resolve(domain_name, record_type)

            results[record_type] = answers
        except (dns.resolver.NoAnswer, dns.resolver.NXDOMAIN, dns.resolver.NoNameservers):
            pass
        except Exception:
            pass
    
    return results
