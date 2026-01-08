REM Traffic Server
docker build -t lionelschiepers/trafficserver:latest -f .\TrafficServer\Dockerfile .\TrafficServer\
docker push lionelschiepers/trafficserver:latest

REM YCast
REM docker build -t lionelschiepers/ycast:latest -f .\YCast\Dockerfile .\YCast\
REM docker push lionelschiepers/ycast:latest

REM YTuner
docker build -t lionelschiepers/ytuner:latest -f .\YTuner\Dockerfile .\YTuner\
docker push lionelschiepers/ytuner:latest

REM Update containers with watchtower
docker run --rm -v /var/run/docker.sock:/var/run/docker.sock nickfedor/watchtower --cleanup --run-once
REM docker image prune -a -f