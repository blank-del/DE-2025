# Docker and MSSQL

Setting up Docker Container to spin up MSSQL Server.

## Building Image

After installing docker run the following command:

```bash
docker build --platform linux/amd64 -t <image_name> .
```

This command ensures that docker builds it using linux platform which is helpful if you are on MacOS. Replace image name with a custom name of your choosing.

## Prerequisite

* Create an environment variable file which contains key value pair which are required for MSSQL Server:

```bash
ACCEPT_EULA=Y
MSSQL_SA_PASSWORD=YourP@ssword
```
* Create a volume which you want to mount so that the data persists outside the container life.
   
## Running Docker

```bash
docker run --platform linux/amd64 -d \                      
--name <container_name> \
--env-file .env \
-p 1433:1433 \
-v <path_to_volume>:/var/opt/mssql \
<image_name>:latest
```
The above command will run the image that you created earlier while using the env file, and volume both of which we created before running this command. It also exposes a port so that we can communicate to the server from outside the container.

## Interacting with Server

Interacting with server is easy as we just need VSCode extension [mssql](https://marketplace.visualstudio.com/items?itemName=ms-mssql.mssql) which comes pretty handy in creating connection to the DB and also running queries on it. 

Connect to the DB using the username `SA` and password which you set using the env variable and voila!