require 'mysql2'
require 'faker'

dbclient = Mysql2::Client.new(
  host: '127.0.0.1',
  port: '13306',
  username: 'root',
  password: 'root',
  database: 'app',
)

query = <<-EOS
CREATE TABLE IF NOT EXISTS users (
  id INT(11) AUTO_INCREMENT NOT NULL,
  name VARCHAR(255) NOT NULL,
  PRIMARY KEY (id)
);
EOS
dbclient.query(query)

tables = dbclient.query('SHOW TABLES;')
tables.each do |t|
  puts t
end

userquery = <<EOS
  INSERT INTO
  users (name)
  VALUES
    #{100.times.map { |_| "('#{Faker::Name.first_name}')" }.join(?,)}
EOS
dbclient.query(userquery)
