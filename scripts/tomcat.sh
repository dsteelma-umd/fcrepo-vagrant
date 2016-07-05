#!/bin/bash

SERVICE_USER_GROUP=vagrant:vagrant

# Tomcat
# can't install via yum since that is only version 6.0.24
TOMCAT_VERSION=7.0.70
TOMCAT_TGZ=/apps/dist/apache-tomcat-${TOMCAT_VERSION}.tar.gz
# look for a cached tarball
if [ ! -e "$TOMCAT_TGZ" ]; then
    TOMCAT_PKG_URL=http://archive.apache.org/dist/tomcat/tomcat-7/v${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz
    curl -Lso "$TOMCAT_TGZ" "$TOMCAT_PKG_URL"
fi
tar xvzf "$TOMCAT_TGZ" --directory /apps

# CATALINA_BASE for our webapps
CATALINA_BASE=/apps/fedora/tomcat

# log and temp directories must be pre-created
mkdir -p "$CATALINA_BASE"/{logs,temp}

# local libs
mkdir -p "$CATALINA_BASE/lib"
cp /apps/dist/optional-authn-valve-*.jar "$CATALINA_BASE/lib"

chown -R "$SERVICE_USER_GROUP" "$CATALINA_BASE"
