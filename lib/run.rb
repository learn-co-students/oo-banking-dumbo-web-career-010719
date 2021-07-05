require "pry"
require "./bank_account.rb"
require "./transfer.rb"
jesus = bank_account.new("jesus")
john = bank_account.new("john")
transfer.new(jesus, john, 50)
