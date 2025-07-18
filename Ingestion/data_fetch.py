# To fetch data from Opendota API
# https://docs.opendota.com/#section/Introduction

import requests
import json
from datetime import date
import os

class fetch_data:
    def __init__(self) -> None:
        self.base_url = 'https://api.opendota.com/api/'
        self.matches = None
        self.base_path = date.today().strftime("%Y/%m/%d")
    def get_matches(self):
        #get random list of matches
        url = self.base_url + 'publicMatches'
        try:
            x = requests.get(url)
            if x.status_code == 200:
                self.matches = json.loads(x.text)
        except:
            print('Error!')
    def write_to_storage(self):
        if not os.path.exists(self.base_path):
            os.makedirs(self.base_path)
        for i in self.matches:
            match_id = i.get('match_id')
            full_path = f'{self.base_path}/{str(match_id)}.json'
            with open(full_path, 'w') as f:
                json.dump(i, f, indent=4)

if __name__ == "__main__":
    s=fetch_data()
    s.get_matches()
    s.write_to_storage()