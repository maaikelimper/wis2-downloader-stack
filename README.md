# wis2-downloader-stack
Docker-compose stack that adds monitoring support for WMO's wis2-downloader

## env file

To set the GRAFANA_ADMIN_USER and GRAFANA_PASSWORD environment variables, create a `.env` file in the root of the project and define the variables as follows:

```bash
GRAFANA_ADMIN_USER=admin
GRAFANA_ADMIN_PASSWORD=yourpassword
```

If you don't set these values the default values are `admin` and `admin`.

## config file

To set the `wis2-downloader` configuration, use the `config.json` file in the root of the project.

Edit the config.json to set topics and select your broker.

## Usage

Run the following command to start the stack:

```bash
docker compose up -d --build
```
