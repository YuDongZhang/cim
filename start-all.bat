@echo off
echo Starting CIM System...

echo Starting Zookeeper...
docker run --rm --name zookeeper -d -p 2181:2181 zookeeper:3.9.2

echo Starting Redis...
docker run --rm --name redis -d -p 6379:6379 redis:7.4.0

echo Waiting for services to start...
timeout /t 10 /nobreak >nul

echo Starting Route Service...
cd cim-forward-route
start "Route Service" mvn spring-boot:run
cd ..

echo Starting CIM Server...
cd cim-server
start "CIM Server" mvn spring-boot:run
cd ..

echo All services started!
echo You can now start the client with: java -jar cim-client/target/cim-client-1.0.0-SNAPSHOT.jar
pause