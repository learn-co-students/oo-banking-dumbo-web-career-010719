require 'pry'
class BankAccount
attr_accessor :balance, :status
attr_reader :name
	def initialize(name)
		@balance = 1000
		@name = name
		@status = "open"
	end

	def deposit(tranfer_amt)
		@balance += tranfer_amt
	end

	def display_balance
		return "Your balance is $#{balance}."
	end

	def valid?
		if @status == "open" && @balance > 0
			true
		else 
			false
		end
	end

	def close_account
		self.status = 'closed'
	end

end
