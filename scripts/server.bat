cd ..
docker-compose up -d spring
docker-compose up -d web
docker-compose ps -q web > tmp.txt
set /p id= < tmp.txt
del tmp.txt
docker attach %id%
docker-compose stop web
