#!/bin/bash

set -e

psql "$POSTGRES_DB" < contactask.sql
