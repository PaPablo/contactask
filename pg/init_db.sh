#!/bin/bash

set -e

psql "$POSTGRES_DB" < contactask.sql
psql -c "ALTER USER "$POSTGRES_USER" PASSWORD '"$POSTGRES_PASSWORD"';"
