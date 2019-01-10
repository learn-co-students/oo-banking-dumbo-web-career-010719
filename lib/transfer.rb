require "pry"
class Transfer
  def initialize(sender, receiver, amount=0)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  attr_reader :status, :sender, :receiver
  attr_accessor :amount

  def valid?
    return sender.valid? && receiver.valid?
  end

  def execute_transaction
    if @sender.balance < @amount
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    if @status != "complete"
      @sender.balance-= amount
      @receiver.deposit(amount)
      @status = "complete"
    end
  end

  def reverse_transfer
    if @status == "complete"
      @receiver.balance-= amount
      @sender.deposit(amount)
      @status = "reversed"
    end
  end
end
