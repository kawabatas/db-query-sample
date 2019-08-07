require 'mysql2'

dbclient = Mysql2::Client.new(
  host: '127.0.0.1',
  port: '13306',
  username: 'root',
  password: 'root',
)

dbclient.query('CREATE DATABASE IF NOT EXISTS app;')

dbs = dbclient.query('SHOW DATABASES;')
dbs.each do |db|
  puts db
end
