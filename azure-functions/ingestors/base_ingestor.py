import os
import json
import requests
from azure.storage.blob import BlobServiceClient
from abc import ABC, abstractmethod
import logging
from datetime import datetime

logging.basicConfig(
    level=logging.INFO,
    format='%(asctime)s - %(levelname)s - %(message)s',
    handlers=[
        logging.StreamHandler()
    ]
)

class BaseIngestor(ABC):
    def __init__(self, api_url: str, container_name: str = "raw") -> None:
        self.api_url = api_url
        self.data = []
        self.container_name = container_name
        self.base_path = datetime.now().strftime("%Y/%m/%d")
        self.connection_string = os.getenv("AZURE_STORAGE_CONNECTION_STRING")
        if not self.connection_string:
            logging.error("AZURE_STORAGE_CONNECTION_STRING environment variable is not set.")
            raise ValueError("AZURE_STORAGE_CONNECTION_STRING environment variable is not set.")
        
        self.blob_service_client = BlobServiceClient.from_connection_string(self.connection_string)
        self.container_client = self.blob_service_client.get_container_client(self.container_name)
        if not self.container_client.exists():
            self.container_client.create_container()
            logging.info(f"Created container: {self.container_name}") 
        else:
            logging.info(f"Using existing container: {self.container_name}")

    @abstractmethod
    def fetch(self) -> bool:
        """Fetch data from API - must be implemented in child classes"""
        pass

    @abstractmethod
    def save(self, data):
        """Save fetched data to Azure Blob Storage - must be implemented in child classes"""
        pass

    def run(self):
        logging.info(f"Starting Ingestion for {self.api_url}")
        if self.fetch():
            logging.info(f"Fetched {len(self.data)} items!")
            logging.info(f"Writing data")
            self.save(self.data)
            logging.info("Ingestion completed successfully")
        else:
            logging.error("Ingestion failed during fetch()")