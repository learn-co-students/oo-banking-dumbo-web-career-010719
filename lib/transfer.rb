require 'pry'
require_relative 'bank_account.rb'
class Transfer
  #@@previous = [{:transaction => {}}]
  attr_reader :sender, :receiver, :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end
  def valid?
    return sender.valid? && receiver.valid?
  end
  def execute_transaction
    # (self.valid? && @@previous[0][:transaction][:a] != :amount &&
    #   @@previous[0][:transaction][:r] != :receiver &&
    #   @@previous[0][:transaction][:s] != :sender)
    if self.valid? && @status == 'pending' && sender.balance - @amount > 0
      #@@previous[0][:transaction] = {:a => :amount, :s => :sender, :r => :receiver}

      @receiver.deposit(@amount)
      @sender.deposit(@amount * -1)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      @sender.deposit(@amount)
      @receiver.deposit(@amount * -1)
      @status = "reversed"
    end
  end
end


# avi = BankAccount.new("Avi")
# amanda = BankAccount.new("Amanda")
# transfer = Transfer.new(amanda, avi, 50)
# bad_transfer =Transfer.new(amanda, avi, 4000)
#
# binding.pry
