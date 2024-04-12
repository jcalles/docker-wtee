## How to Use this Image
# environments:
LOGPATH= Path to search any log file with extension .log  ie ( LOGPATH=/var/log)
Inside port: 8080

### STEPS
* 1) docker docker pull javiercalles/wtee
   
For testing :
create dir test and file test.log like this:
```shell
mkdir test && touch test/test.log
```
  
* 2) 
```
docker run --rm -it --name=testlogs -v "$(pwd)/test:/test" -p 8080:8080 -e "LOGPATH=/test" javiercalles/wtee
```

* 3) run this command:

	```bash
###	
while true; do sleep 2;echo "test logs in $(hostname) at $(date +%Y%d%m-%H:%M:%S)" >> test/test.log;done
## or
bash test-script.sh
```
* 4) put in your brower
	* http://localhost:8080/     


### docker-compose

```yml
version: '3'

services:
  applications:
    image: tianon/true
    volumes:
      - "./data/logs:/var/log/nginx"

  logs:
    image: javiercalles/wtee
    tty: true
    ports:
      - "8080:8080"
    volumes:
      - "./data/logs:/var/log"
    environment:
      - LOGPATH=/var/log/nginx

  apache:
    image: nginx
    tty: true
    ports:
      - "8081:80"
    volumes_from:
      - applications
```
### UPDATE
if you need to get logs from running container, and container has volumes exposed, run this:
```bash
docker run --rm -it --name testlogs --link <CONTAINERNAME/ID> --network CONTAINERNETWORK -p PORT:8080 --volumes-from CONTAINERNAME/ID  javiercalles/wtee sh
```
### Enjoy it!!!
