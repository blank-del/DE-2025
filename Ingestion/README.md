# Data Ingestion for Dota2

We will be using the [OpenDota API](https://docs.opendota.com/#section/Introduction) which is a RESTful API to get all of our data. OpenDota provides different endpoints which we will make use of

## Endpoint Information

- `GET /publicMatches` lists random public matches. (Returns 100 matches)
- `GET /matches/{match_id}` Query a certain match to get detailed information
- `GET /distributions` Rank distributions of players
- `GET /benchmarks/{hero_id}` Average benchmarks for a certain hero e.g. (xpm, gpm, kill per min etc.)
- `GET /heroes` Get current heroes info e.g. (role, name, attributes etc.)
- `GET /heroes/{hero_id}/durations` Gives number of games played and won in a specific bin
- `GET /heroes/{hero_id}/itemPopularity` Gives the popular items with respect to game stage (early game, late game)
- `GET /heroStats` To get all the information about heroes e.g. (base_health, str_gain etc.)

## Frequency of Querying

Since there is a upper bounds for accessing the API endpoints of 2000 requests per day and 60 requests per min we will be orchestrating the ingestion accordingly.

| API Endpoint  | Frequency |
| ------------- | ------------- |
| publicMatches  | Once every 5 minutes  |
| matches/{match_id}  | For every match  |
| distributions  | Once daily  |
| benchmarks/{hero_id}  | For each hero  |
| heroes  | Once daily  |
| heroes/{hero_id}/durations  | For each hero  |
| heroes/{hero_id}/itemPopularity  | For each hero  |
| heroStats  | Once daily  |