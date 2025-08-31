import logging
import datetime
from ..ingestors.public_match_ingestor import PublicMatchIngestor
import azure.functions as func

def main(mytimer: func.TimerRequest) -> None:
    utc_timestamp = datetime.datetime.utcnow().replace(
        tzinfo=datetime.timezone.utc).isoformat()
    logging.info("Azure Function: Public Match Ingestor started")

    if mytimer.past_due:
        logging.info("The timer is past due! It was last scheduled at %s", utc_timestamp)

    ingestor = PublicMatchIngestor()
    ingestor.run()
    
    logging.info("Azure Function: Public Match Ingestor finished")