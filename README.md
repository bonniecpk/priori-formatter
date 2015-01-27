###Dependencies
- Use Ruby 2.1.3
- Install bundler
    [host]$ gem install bundler

###Setup
    [host]$ git clone git@github.com:bonniecpk/priori-formatter.git
    [host]$ bundle

###To run
    [host]$ ruby app.rb -s /path/to/space-delimited-input -p /path/to/pipe-delimited-input -c /path/to/comma-delimited-input -o /path/to/output

###To run tests
    [host]$ rspec

###To see command-line options
    [host]$ ruby app.rb -h
