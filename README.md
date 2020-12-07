# vRPold-ghmattimysql-Adaptation

A basic adaptation to ghmattimysql for old vRP (DUNKO).

```Be sure to start in this order ghmattimysql, vrp_mysql and then vrp!```

* Tutorial

1. Delete from `vrp/base.lua` these lines:
```lua
MySQL.debug = config.debug

-- open MySQL connection
MySQL.createConnection("vRP", config.db.host,config.db.user,config.db.password,config.db.database)
```

2. Delete from `vrp/cfg/base.lua` these lines:
```lua
cfg.db = {
  host = "127.0.0.1", -- database ip (default is local)
  database = "vrpfx",   -- name of database
  user = "root",    --  database username
  password = ""   -- password of your database
}
```

3. Go to your `ghmattimysql/config.json` and edit by you like:
```json
{
    "user": "root",
    "password": "",
    "host": "localhost",
    "port": "3306",
    "database": "vrp"
}
```

4. Enjoy it!
