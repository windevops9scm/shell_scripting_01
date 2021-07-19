help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:  ##  install frontend component
	@frontend.sh
catalouge: ##  install catalouge component
	@catalouge.sh
cart: 	   ##  install cart component
	@cart.sh
user:	   ##  install user component
	@user.h
shipping:  ##  install shipping component
	@shipping.sh
payment:   ##  install payment component
	@payment.sh
mongodb:   ##  install mongodb component
	@mongodb.sh
redis:	   ##  install redis component
	@redis.sh
mysql:	   ##  install mysql component
	@mysql.sh
rabbitmq:  ##  install rabbitmq component
	@rabbitmq.sh
databases: mongo redis mysql rabbitmq  ##  install all databases
