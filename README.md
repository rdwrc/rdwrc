# Ralph D. Winter Research Center

## Twitter Bootstrap

see [http://railsapps.github.io/twitter-bootstrap-rails.html](http://railsapps.github.io/twitter-bootstrap-rails.html)

## Testing

1. To run all tests do following

> $ rake db:drop db:create db:migrate db:seed db:test:prepare

> $ rspec spec

## Development

1. clear all existing temporary files and log files

> $ rake tmp:clear log:clear

2. To run the server (to stop server use "ctrl-c")

> $ bundle exec rails server

3. Open seperate window and monitor the log file

> $ tail -f log/development.log
