class Transfer
  # your code here

  attr_reader   :status, :sender,:receiver, :amount
  def initialize(sender,receiver,  amount)
    @sender = sender
    @receiver=receiver
    @status= "pending"
    @amount= amount
  end

  def valid?
    if @sender.valid? == true && @receiver.valid? == true
      true
   else false
   end
  end

  def execute_transaction
    if @status=="pending"
      if  @sender.balance < @amount || @sender.valid? == false
        @status ="rejected"
        return "Transaction rejected. Please check your account balance."
  else  @receiver.deposit(@amount)
         @sender.balance -= @amount
         @status ="complete"
         end
       end
      end

      def reverse_transfer
       if @status == "complete"
          @receiver.balance -= @amount
          @sender.balance += @amount
          @status = "reversed"
       end

      end
    end
#so hard
