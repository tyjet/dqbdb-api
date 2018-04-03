docker-compose -f docker-compose.test.yml up -d test-pg spring
docker-compose -f docker-compose.test.yml run --rm test
