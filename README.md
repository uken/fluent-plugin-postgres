# fluent-plugin-postgres, a plugin for [Fluentd](http://fluentd.org)

## Installation:

- Prereq: Install postgresql headers: `apt-get install libpq-dev`
- Install the gem:
  - `gem install fluent-plugin-postgres` or
  - `/usr/lib/fluent/ruby/bin/fluent-gem install fluent-plugin-postgres`

## About:

This plugin is an adaptation of the MySQL plugin.

- Does not currently support json format ( see [fluent-plugin-pgjson](https://github.com/fluent-plugins-nursery/fluent-plugin-pgjson))
- Placeholders are numbered.

### Quick example
```
  <match output.by.sql.*>
    @type postgres
    host master.db.service.local
    # port 5432 # default
    database application_logs
    username myuser
    password mypass
    key_names status,bytes,vhost,path,rhost,agent,referer
    sql INSERT INTO accesslog (status,bytes,vhost,path,rhost,agent,referer) VALUES ($1,$2,$3,$4,$5,$6,$7)
    <buffer>
      flush_intervals 5s
    </buffer>
  </match>
```

## Configuration

### Option Parameters

#### Connection Parameters

* host
* port
* database
* username
* password

The standard information needed to connect to the database as for any SQL application. Port is defaulted to 5432.

#### key_names

A comma seperated list of the key names from the Fluentd record that will be written to the database.

The *key_names* do not need to match the field names of your database, but the order does need to match. Each key will be replaced in the insert values by the corresponding numbered placeholder ($1,$2...).

#### sql

A SQL query to insert the record. This is a standard insert query. The Postgres numbered place holder format is required. It is required to provide either a query or *table* and *columns* parameters, in which case this plugin will generate the insert query for you.

For simple inserts it is easier to use *table* and *columns*, sql will permit use of a function or custom sql.

An exception will be raised if both *columns* and *sql* are provided.

#### columns

By providing a comma seperated list of *columns* and *table* the plugin will generate an insert query for *sql*.

#### table

The table name, required with *columns*, ignored with *sql*.

## More Examples

```

  <match output.by.names.*>
    @type postgres
    ...
    table accesslog
    key_names status,bytes,vhost,path,rhost,agent,referer
    # 'columns' names order must be same with 'key_names'
    columns status,bytes,vhost,path,rhost,agent,referer
    ...
  </match>

  <match output.with.tag.and.time.*>
    @type postgres
    ...
    <extract>
      include_time_key yes
      ### default `time_format` is ISO-8601
      # time_format %Y%m%d-%H%M%S
      ### default `time_key` is 'time'
      # time_key timekey

      include_tag_key yes
      ### default `tag_key` is 'tag'
      # tag_key tagkey
    </extract>

    key_names time,tag,field1,field2,field3,field4
    sql INSERT INTO baz (coltime,coltag,col1,col2,col3,col4) VALUES ($1,$2,$3,$4,$5,$6)
    ...
  </match>
```

## Troubleshooting

The Default output level of fluentd will not display important errors generated from this plugin. Use the -v or -vv flags to see them.

The --dry-run flag will attempt to parse the config file without starting fluentd.

## TODO

* implement json support
* implement 'tag_mapped'
* dynamic tag based table selection

## Copyright

* Copyright
  * Copyright 2013-2020 Uken Games
* License
  * Apache License, Version 2.0
