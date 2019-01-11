class Transfer
  # your code here
  attr_accessor :amount, :status, :bank_account
  def initialize(sender, receiver, amount)
    @sender=sender
    @receiver=receiver
    @amount=amount
    @status="pending"
  end

  def sender
    @sender
  end

  def receiver
    @receiver
  end

  def valid?
    if sender.valid? && receiver.valid?
       true
    else
      false
    end
  end

  def execute_transaction

     if self.valid? && (self.sender.balance > self.amount)
        self.receiver.balance+=self.amount
        self.sender.balance-=self.amount
        self.status="complete"
        self.sender.status="closed"
     else 
        self.status="rejected"
        "Transaction rejected. Please check your account balance."
     end

  end

  def reverse_transfer
      execute_transaction
      self.receiver.balance-=self.amount
      self.sender.balance+=self.amount
      self.status="reversed"
  end

end

