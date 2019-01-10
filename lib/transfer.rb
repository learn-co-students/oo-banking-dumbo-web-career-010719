class Transfer
  attr_accessor :sender, :receiver, :amount, :balance, :status, :amount, :last_amount

  def initialize(sender,receiver,amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
    @last_amount = amount
  end

  def valid?
    sender.valid? == true && receiver.valid? == true
  end


  def execute_transaction

      if valid? && sender.balance > self.amount
        @sender.balance -= self.amount
        @receiver.balance += self.amount
        @status = "complete"
        self.amount = 0
      else
        @status = "rejected"
        "Transaction rejected. Please check your account balance."
      end
  end
  def reverse_transfer
    if @status == "complete"
      @sender.balance += self.last_amount
      @receiver.balance -= self.last_amount
      @status = "reversed"
    end
  end

end
