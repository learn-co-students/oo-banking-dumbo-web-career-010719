class Transfer
 attr_reader :sender, :receiver, :amount
 attr_accessor :status
 def initialize(sender, receiver, amount)
   @sender = sender
   @receiver = receiver
   @amount = amount
   @status = "pending"
 end

 def valid?
   sender.valid? && receiver.valid?
 end

 def execute_transaction
   if self.valid? && @amount < sender.balance && @status == "pending"
     sender.deposit(-self.amount)
     receiver.deposit(self.amount)
     self.status = "complete"
   else
     self.status = "rejected"
     "Transaction rejected. Please check your account balance."
   end
 end
 def reverse_transfer
   if @status == "complete"
     sender.deposit(self.amount)
     receiver.deposit(-self.amount)
     self.status = "reversed"
   end
 end
end
