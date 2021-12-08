        #!/bin/sh
  check(){     
        ps auxw | grep nginx | grep -v grep > /dev/null
        if [ $? != 0 ]
        then
        echo "NGINX is not running!!! Trying to start...." && \\
        start
        sleep 5
        check


           
        else
        echo "NGINX is running"
        break
        fi}
start(){$NGINX_START_COMMAND}
#backup(){cp -R $NGINX_HOME $NGINX_BAK_DIR.$(date +"%Y.%m.%d-%H:%M)}