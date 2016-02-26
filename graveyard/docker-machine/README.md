# Docker Machine

I tried to run Docker Machine inside a Docker container but that doesn't seem to 
be useful because Docker Machine seems just to update Docker related environment 
variables and setting them inside a ephemeral Docker container doesn't have any
useful effect.

`eval "$(docker-machine env dev)"` is what actually sets the environment, this
should also work with Docker Machine running in a container but I have already
installed it locally
