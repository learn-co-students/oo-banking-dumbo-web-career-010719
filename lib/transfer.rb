class Transfer
  attr_accessor :sender, :receiver, :status, :amount, :last_amount
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    self.sender.valid? && self.receiver.valid?
  end
  
  def execute_transaction
    if sender.balance < self.amount
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
    else
      sender.balance -= self.amount
      receiver.deposit(self.amount)
      self.last_amount = self.amount
      self.amount = 0
      self.status = "complete"
    end
  end
  
  def reverse_transfer
    if self.status == "complete"
        receiver.balance -= self.last_amount
        sender.deposit(self.last_amount)
        self.status = "reversed"
    end
  end
end