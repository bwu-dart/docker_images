### Run **docker-compose**
```bash
docker run -v "$(pwd)":/app -v /var/run/docker.sock:/var/run/docker.sock -ti dduportal/docker-compose:latest --help
```
