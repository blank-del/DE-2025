# To fetch data from Opendota API
# https://docs.opendota.com/#section/Introduction

import requests
import json
from datetime import date
import os
from azure.storage.blob import BlobServiceClient

class fetch_data:
    def __init__(self) -> None:
        self.base_url = 'https://api.opendota.com/api/'
        self.matches = None
        self.base_path = date.today().strftime("%Y/%m/%d")
    def get_matches(self) -> None:
        #get random list of matches
        url = self.base_url + 'publicMatches'
        try:
            x = requests.get(url)
            if x.status_code == 200:
                self.matches = json.loads(x.text)
        except:
            print('Error!')
    def write_to_storage(self) -> None:
        connection_string = os.getenv("AZURE_STORAGE_CONNECTION_STRING")
        blob_service_client = BlobServiceClient.from_connection_string(connection_string)
        container_client = blob_service_client.get_container_client("raw")
        if not container_client.exists():
            container_client.create_container()

        for i in self.matches:
            match_id = i.get('match_id')
            full_path = f'"publicMatches"/{self.base_path}/{str(match_id)}.json'
            container_client.upload_blob(
                name=full_path,
                data=json.dumps(i, indent=4),
                overwrite=True
            )

if __name__ == "__main__":
    s=fetch_data()
    s.get_matches()
    s.write_to_storage()