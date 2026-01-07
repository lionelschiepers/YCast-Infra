docker build -t lionelschiepers/trafficserver:latest -f .\TrafficServer\Dockerfile .\TrafficServer\
docker push lionelschiepers/trafficserver:latest

docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nickfedor/watchtower --cleanup --run-once

docker build -t lionelschiepers/ycast:latest -f .\YCast\Dockerfile .\YCast\
docker push lionelschiepers/ycast:latest

docker build -t lionelschiepers/ytuner:latest -f .\YTuner\Dockerfile .\YTuner\
docker push lionelschiepers/ytuner:latest
