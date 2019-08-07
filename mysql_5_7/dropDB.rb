require 'mysql2'

dbclient = Mysql2::Client.new(
  host: '127.0.0.1',
  port: '13306',
  username: 'root',
  password: 'root',
)

dbclient.query('DROP DATABASE IF EXISTS app;')

dbs = dbclient.query('SHOW DATABASES;')
dbs.each do |db|
  puts db
end
