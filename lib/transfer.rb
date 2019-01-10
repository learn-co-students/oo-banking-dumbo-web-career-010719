require 'pry'
class Transfer
  attr_accessor :sender, :receiver, :amount, :status

  def initialize(account1 ,account2 ,transfer_amount)
    @sender = account1
    @receiver = account2
    @amount = transfer_amount
    @status = "pending"
  end

  def valid?
    @sender.valid? == @receiver.valid?

  end

  def execute_transaction
    if self.status == "pending"
      if @sender.valid? == false || @sender.balance <= @amount
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
      @receiver.balance += @amount
      @sender.balance -= @amount
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance >= @amount
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end
