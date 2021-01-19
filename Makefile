start:
	docker-compose up -d

stop:
	docker-compose down

reload:
	docker exec caddy caddy reload

restart: start
	
docker:
	docker run --rm -d --name caddy \
	-p 2019:2019 -p 80:80 -p 443:443 \
	--network caddy \
	-v $(PWD)/Caddyfile:/srv/Caddyfile \
	-v $(PWD)/www:/var/www \
	-v caddy_data:/data \
	caddy caddy run
