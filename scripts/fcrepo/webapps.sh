#!/bin/bash

WEBAPP_DIR=/apps/fedora/webapps
mkdir -p "$WEBAPP_DIR"
cd /apps/dist
cp umd-fcrepo-webapp-1.0.0.war fcrepo-user-webapp-1.0.0.war "$WEBAPP_DIR"
