## How to Use this Image
# environments:
LOGPATH= Path to search any log file with extension .log  ie ( LOGPATH=/var/log)
Inside port: 8080

### STEPS
* 1) docker docker pull javiercalles/wtee
   
For testing :
create dir test and file test.log like this:
```bash
mkdir test && touch test/test.log
```
  
* 2) docker run --rm -it --name=testlogs -v "\<LOCALPATH>/test:/var/log" -p 8080:8080 -e "LOGPATH=/var/log" javiercalles/wtee

* 3) run this command:
```bash
while true; do sleep 2;echo "test logs in $(hostname) at $(date +%Y%d%m-%H:%M:%S)" >> test/test.log;done
```
* 4) put in your brower"
    * http://localhost:8080/     


###docker-compose

```yml
version: '2'
services:
 aplications:
    image: tianon/true
    volumes:
      - "./data/logs:/var/log/nginx"
 logs:
    image: javiercalles/wtee
    tty: true
    ports:
      - "8080:8080"
    volumes_from:
      - aplications
    environment:
      - LOGPATH=/var/log

 apache:
    image: nginx
    tty: true
    ports:
      - "8081:80"
    volumes_from:
      - aplications
```

###Enjoy it!!!