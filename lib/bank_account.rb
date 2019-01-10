
  require "pry"

  class BankAccount
     attr_reader :name, :balance, :status


     def initialize(name, balance = 1000, status = "open")
       @name = name
       @balance = balance
       @status = status
     end

     def deposit(num)
       @balance += num
     end

     def display_balance
       "Your balance is $#{self.balance}."
     end

      def balance=(balance)
        @balance = balance
      end

      def status=(status)
       @status = status
      end

      def valid?
       if self.balance > 0 && self.status ==  "open"
         true
       else
        false
      end
   end

   def close_account
     @status = "closed"
   end

  end
