help:           ## Show this help.
	@fgrep -h "##" $(MAKEFILE_LIST) | fgrep -v fgrep | sed -e 's/\\$$//' | sed -e 's/##//'

frontend:  ##  install frontend component
	@bash frontend.sh
catalogue: ##  install catalogue component
	@bash catalogue.sh
cart: 	   ##  install cart component
	@bash cart.sh
user:	   ##  install user component
	@bash user.h
shipping:  ##  install shipping component
	@bash shipping.sh
payment:   ##  install payment component
	@bash payment.sh
mongodb:   ##  install mongodb component
	@bash mongodb.sh
redis:	   ##  install redis component
	@bash redis.sh
mysql:	   ##  install mysql component
	@bash mysql.sh
rabbitmq:  ##  install rabbitmq component
	@bash rabbitmq.sh
databases:  ##  install all databases
databases: mongo redis mysql rabbitmq
