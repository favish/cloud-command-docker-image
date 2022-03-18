#!/usr/bin/env bash

# Use to ensure that the database exists

echo "Creating database $MYSQL_DB (IF NOT EXISTS)..."
mysql -u$MYSQL_USER -p$MYSQL_PASS -h$MYSQL_HOST -e "create database if not exists $MYSQL_DB"