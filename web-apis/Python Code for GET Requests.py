# Import required libraries
import requests
from urllib import quote_plus
import json
import pandas as pd

# Create objects holding the key, base url, and response format
key="ef9055ba947dd842effe0ecf5e338af9:15:72340235"
base_url="http://api.nytimes.com/svc/search/v2/articlesearch"
response_format=".json"

# Specify a main search term (q)
search_term="jazz is dead"

# Specify and encode filters (fc)
filter_query="body:\"jazz is dead\"" 

# URL encode the search and its filters
search_term=quote_plus(search_term)
filter_query=quote_plus(filter_query)
print search_term
print filter_query

# Paste components together to create URL for get request
get_request=base_url+response_format+"?"+"q="+search_term+"&fq="+filter_query+"&api-key="+key
print get_request

# Send the GET request using requests
response=requests.get(get_request)
print response

# Alternative way to encode GET requests using dictionaries
key="ef9055ba947dd842effe0ecf5e338af9:15:72340235"
base_url="http://api.nytimes.com/svc/search/v2/articlesearch"
response_format=".json"
search_term="jazz is dead"
filter_query="body:\"jazz is dead\"" 
params={"q":search_term,
        "fq":filter_query,
        "api-key":key}
response=requests.get(base_url+response_format, params=params)
print response

# Inspect the content of the response, parsing the result as text
response_text=response.text
print response_text

# Convert JSON response to a dictionary
data=json.loads(response_text)
print data

