class Transfer

  attr_accessor :sender, :receiver, :amount, :status

  def initialize(sender, receiver, amount, status = "pending")
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = status
  end

  def valid?
    if self.sender.valid? && self.receiver.valid? && self.amount >0
      true
    else
      false
    end
  end

  def execute_transaction
    if self.sender.valid? && self.receiver.valid? && self.amount >0 && self.status == "pending" && self.amount < self.sender.balance
      self.status = "complete"
      self.sender.balance -= self.amount
      puts self.sender.balance
      self.receiver.balance += self.amount
      true
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance."
      # false
    end
  end


  def reverse_transfer
      #if self.status == "completed" && self.sender.valid? && self.receiver.valid? && self.amount >0 && self.amount < self.sender.balance
        execute_transaction
        self.status = "reversed"
        self.sender.balance += self.amount
        self.receiver.balance -= self.amount
        # false
      #end
    end
end


# Transfer.new(amanda, avi, 50)
