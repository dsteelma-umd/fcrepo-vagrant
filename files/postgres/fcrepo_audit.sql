-- tables

CREATE TABLE history (
    event_uri VARCHAR PRIMARY KEY,
    event_type VARCHAR NOT NULL,
    username VARCHAR NOT NULL,
    resource_uri VARCHAR NOT NULL,
    timestamp TIMESTAMP WITH TIME ZONE NOT NULL
);

-- indexes

CREATE INDEX history_username_index ON history (username);
CREATE INDEX history_resource_uri_index ON history (resource_uri);
CREATE INDEX history_timestamp_index ON history (timestamp);

-- users and permissions

CREATE USER camel WITH PASSWORD 'camel';

GRANT SELECT, INSERT ON history TO camel;
