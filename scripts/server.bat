docker-compose up -d spring
docker-compose up -d web
docker-compose ps -q web > tmp
set /p id= < tmp
del tmp
docker attach %id%
docker-compose stop web
