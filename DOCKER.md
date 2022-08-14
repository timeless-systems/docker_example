## Install

```
npm i 
```

## Build

```
docker build . -t timeless/docker-example:latest-armv64-v8
```

```
docker buildx build -t timeless/docker-example:latest \
  --platform linux/amd64,linux/arm64,linux/ppc64le --push .
```

```
docker push timeless/docker-example:latest
```

## Run

```
docker run -p 49160:8080 -d --name demo timeless/docker-example
```

## Excercise

Get container ID
```
docker ps
```

## Print app output
```
docker logs <container id>
```

Running on http://localhost:49160

## Enter the container
```
docker exec -it <container id> /bin/bash
```

## Test the response

```
curl -i localhost:49160
curl -i localhost:49160/pid

```

## Kill the container

Kill our running container
```
docker kill <container id>
```

```
docker ps
```

Confirm that the app has stopped
```
url -i localhost:8080/pid
```

## Docker registry

```
docker login -u your_dockerhub_username -p your_dockerhub_password
```

```
docker push
```

```
docker pull
```