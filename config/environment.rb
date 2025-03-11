require 'bundler'
Bundler.require

ActiveRecord::Base.establish_connection(adapter: 'sqlite3', database: 'db/development.db')
require_all 'lib'
ActiveRecord::Base.logger = nil


# if error pops up, enter below in the terminal
# export SINATRA_ACTIVESUPPORT_WARNING=false
