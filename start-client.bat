@echo off
echo Starting CIM Client...

echo Building client...
cd cim-client
mvn clean package -DskipTests

echo Starting client...
echo Please make sure the route service is running on http://localhost:8083
java -jar target/cim-client-1.0.0-SNAPSHOT.jar --server.port=8084 --cim.user.id=1001 --cim.user.userName=TestUser --cim.route.url=http://localhost:8083

cd ..