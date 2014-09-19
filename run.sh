#!/bin/bash
# Executing supervisord and mysql_user
# Author : Kaushal Kishore <kaushal.rahuljaiswal@gmail.com>

/mysql_user.sh
exec supervisord -n
