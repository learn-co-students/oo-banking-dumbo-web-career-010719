require 'pry'

class Transfer

  attr_reader :sender, :receiver
  attr_accessor :status, :amount

  def initialize(sender, receiver, amount=50, status="pending")
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? == true && receiver.valid? == true && sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if self.valid?
      sender.balance -= @amount
      receiver.balance += @amount
      self.status = "complete"
      self.sender.status = "closed"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += @amount
      receiver.balance -= @amount
      self.status = "reversed"
    end
  end

end
