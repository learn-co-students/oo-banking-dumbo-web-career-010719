require 'pry'
require_relative 'bank_account.rb'

class Transfer
  attr_reader :sender, :receiver, :status, :amount
  # your code here
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    return sender.valid? && receiver.valid?
  end
  #
  def execute_transaction
    if self.valid? && @status == "pending" && sender.balance - @amount  > 0
      @receiver.deposit(@amount)
      @sender.deposit(@amount * -1)
      @status = "complete"
    # elsif sender.valid? == false && receiver.valid? == true
      # binding.pry
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
      #@@@@
    end
  end

    def reverse_transfer
      # execute_transaction
      if @status == "complete"
      @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)
      @status = "reversed"
      # binding.pry
      end
    end


  # def reverse_tra
  # nsfer
  #   execute_transaction
  #   if sender.valid?
  #     @receiver -= @amount
  #     @sender += @amount
  #   end
  # end

end

#
# avi = BankAccount.new("Avi")
# amanda = BankAccount.new("Amanda")
# transfer = Transfer.new(amanda, avi, 50)
# bad_transfer = Transfer.new(amanda, avi, 4000)
