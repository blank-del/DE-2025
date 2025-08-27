from abc import ABC, abstractmethod
import logging

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler()
    ]
)

class BaseIngestor(ABC):
    def __init__(self, api_url: str):
        self.api_url = api_url

    @abstractmethod
    def fetch(self):
        pass

    @abstractmethod
    def save(self, data):
        pass

    def run(self):
        logging.info(f"Starting Ingestion for {self.api_url}")
        data = self.fetch()
        if data:
            logging.info(f"Records fetched successfullt!")
            logging.info(f"Writing data")
            self.save(data)
        else:
            logging.warning("No data was fetched")