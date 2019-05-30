require_relative '../config/environment'
require 'pry'
cli = CommandLineInterface.new

cli.sign_in_user
cli.run

# ruby bin/run.rb
