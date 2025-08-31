# To fetch data from Opendota API
# https://docs.opendota.com/#section/Introduction
import requests
from datetime import date
import json
from .base_ingestor import BaseIngestor

class PublicMatchIngestor(BaseIngestor):
    def __init__(self) -> None:
        super().__init__("https://api.opendota.com/api/publicMatches")

    def fetch(self) -> bool:
        #get random list of matches
        try:
            x = requests.get(self.api_url)
            if x.status_code == 200:
                self.data = json.loads(x.text)
            return True
        except:
            return False
        
    def save(self, data) -> None:
        for i in self.data:
            match_id = i.get('match_id')
            full_path = f'publicMatches/{self.base_path}/{str(match_id)}.json'
            self.container_client.upload_blob(
                name=full_path,
                data=json.dumps(i, indent=4),
                overwrite=True
            )