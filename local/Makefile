compose:
	@docker-compose up -d

scale:
	@docker-compose scale server=5

run:
	@ docker exec local_master_1 jmeter -n  -X \
	 -Jclient.rmi.localport=7000 \
	 -Jserver.rmi.ssl.disable=true \	 
	 -t /jmeter/sample.jmx -R local_server_1,local_server_2,local_server_3
	 -l resut.jtl
