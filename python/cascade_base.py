
from suds.client import Client

## Utilities and variables
cascade = Client("YOUR_CASCADE_WEBSERVICE_ENDPOINT")
auth = cascade.factory.create('authentication')
auth.username = 'YOUR_CASCADE_USERNAME'
auth.password = 'YOUR_CASCADE_PASSWORD'
