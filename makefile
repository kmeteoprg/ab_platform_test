install:
	docker-compose build
	docker-compose run app rails db:prepare
run:
	docker-compose up
stop:
	docker-compose down
specs:
	docker-compose run app rspec spec
c:
	docker-compose run app rails console