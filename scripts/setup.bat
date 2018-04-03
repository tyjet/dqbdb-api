docker-compose down
docker-compose -f docker-compose.test.yml down

docker volume rm dqbdb-api-gems > NUL
docker volume create --name=dqbdq-api-gems
docker volume create --name=dqbdq-api-spring

docker-compose run base bundle config --local without "production"
docker-compose run base bundle config --delete frozen

script/bootstrap.bat

docker-compose run base rails db:setup

docker-compose -f docker-compose.test.yml up -d test-pg spring
docker-compose -f docker-compose.test.yml run test rails db:setup db:test:prepare
