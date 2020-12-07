local MySQL = {}

local MySQLCommands = {}
function MySQL.createCommand(name, command)
  if not MySQLCommands[name] then
      MySQLCommands[name] = command
  end
end

function MySQL.execute(name, args, cb)
  if MySQLCommands[name] then
      local args2 = {}
      if args then
          for k, v in pairs(args) do
              args2['@'..k] = v
          end
      end
      exports.ghmattimysql:execute(MySQLCommands[name], args2)
      if cb then
          local task = Task(cb)
          task({})
      end
  else
    print("^1MySQL: error the command "..name.." doesn't exist")
  end
end

function MySQL.query(name, args, cb)
  if MySQLCommands[name] then
    local args2 = {}
    if args then
        for k, v in pairs(args) do
            args2['@'..k] = v
        end
    end
    if cb then
        local task = Task(cb)
        local res = {}
        exports.ghmattimysql:execute(MySQLCommands[name], args2, function (result)
          res = result
        end)
        task({res})
    else
      exports.ghmattimysql:execute(MySQLCommands[name], args2)
    end
  else
    print("^1MySQL: error the command "..name.." doesn't exist")
  end
end

return MySQL