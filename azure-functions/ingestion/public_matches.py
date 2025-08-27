# To fetch data from Opendota API
# https://docs.opendota.com/#section/Introduction
import requests
from datetime import date
import json
import os
from azure.storage.blob import BlobServiceClient
from base_ingestor import BaseIngestor

class PublicMatchIngestor(BaseIngestor):
    def __init__(self) -> None:
        super().__init__("https://api.opendota.com/api/publicMatches")
        self.matches = None
        self.base_path = date.today().strftime("%Y/%m/%d")
    def fetch(self) -> bool:
        #get random list of matches
        try:
            x = requests.get(self.api_url)
            if x.status_code == 200:
                self.matches = json.loads(x.text)
            return True
        except:
            return False
    def save(self, data) -> None:
        connection_string = os.getenv("AZURE_STORAGE_CONNECTION_STRING")
        blob_service_client = BlobServiceClient.from_connection_string(connection_string)
        container_client = blob_service_client.get_container_client("raw")
        if not container_client.exists():
            container_client.create_container()

        for i in self.matches:
            match_id = i.get('match_id')
            full_path = f'publicMatches/{self.base_path}/{str(match_id)}.json'
            container_client.upload_blob(
                name=full_path,
                data=json.dumps(i, indent=4),
                overwrite=True
            )

if __name__ == "__main__":
    s=PublicMatchIngestor()
    s.run()