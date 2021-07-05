class Transfer

  attr_accessor :status, :amount
  attr_reader :sender, :receiver

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid? && sender.balance > @amount
      true
    else
      false
    end
  end

  def execute_transaction
    if valid?
      sender.balance -= @amount
      receiver.balance += @amount
      sender.status="closed"
      self.status="complete"
    else
      @status="rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if execute_transaction
      sender.balance += @amount
      receiver.balance -= @amount
      @status = "reversed"
    end
  end

end












































# require 'pry'
#
# class Transfer
#
#   attr_reader :sender, :receiver
#   attr_accessor :status, :amount
#
#   def initialize(sender, receiver, amount=50, status="pending")
#     @sender = sender
#     @receiver = receiver
#     @status = status
#     @amount = amount
#   end
#
#   def valid?
#     if sender.valid? == true && receiver.valid? == true && sender.balance > @amount
#       true
#     else
#       false
#     end
#   end
#
#   def execute_transaction
#     if self.valid?
#       sender.balance -= @amount
#       receiver.balance += @amount
#       self.status = "complete"
#       self.sender.status = "closed"
#     else
#       self.status = "rejected"
#       "Transaction rejected. Please check your account balance."
#     end
#   end
#
#   def reverse_transfer
#     if self.status == "complete"
#       sender.balance += @amount
#       receiver.balance -= @amount
#       self.status = "reversed"
#     end
#   end
#
# end
