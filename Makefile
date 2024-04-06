bash:
	docker-compose run -it web bash

rails-c:
	docker-compose run -it web rails c

attach:
	docker attach dry_beans-web-1