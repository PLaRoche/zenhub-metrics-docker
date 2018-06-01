## Set up and run Zenhub Metrics

Pulled from: https://github.com/skyscrapers/docker-images/blob/master/zenhub_metrics/Dockerfile

Uses:
https://github.com/Adphorus/zenhub-charts
https://github.com/PLaRoche/zenhub-charts (fixes migration issue)

### Configuration
- Set you zenhub and github api keys in `docker-compose.yml`
- `docker-compose up`
 - this will turn the stack on and run the migrations, setting up your db

#### Initialize
docker-compose run web fetch --initial

#### turn web server on
docker-compose run --service-ports web runserver 0.0.0.0:8000 --insecure

#### Only the worker
- you only need to run it as a worker, whick you can do by setting all your envs in your environment and:

`docker-compose -f docker-compose-worker.yml run web fetch`

- I use manifold to manage my secrets, so I just put `manifold run -t manifold -p zenhub-metrics` inline and before the above command.
