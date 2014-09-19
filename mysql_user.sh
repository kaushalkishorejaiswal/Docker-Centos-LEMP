#!/bin/bash
# Create MySQL user
# Author : Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>
/usr/bin/mysqld_safe > /dev/null 2>&1 &

RET=1
while [[ RET -ne 0 ]]; do
    echo "=> Waiting for confirmation of MySQL service startup"
    sleep 10
    mysql -uroot -e "status" > /dev/null 2>&1
    RET=$?
done

mysql -uroot -e "CREATE USER '${MYSQL_USER}'@'%' IDENTIFIED BY '${MYSQL_PASS}'"
mysql -uroot -e "GRANT ALL PRIVILEGES ON *.* TO '${MYSQL_USER}'@'%' WITH GRANT OPTION"

echo "MySQL User : ${MYSQL_USER} and MySQL Password : ${MYSQL_PASS}"
mysqladmin -uroot shutdown
