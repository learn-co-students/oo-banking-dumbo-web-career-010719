class BankAccount
  attr_reader :name, :recever, :sender
  attr_accessor :balance, :status

  def initialize(name)
      @name = name
      @balance = 1000
      @status = "open"
  end

  def deposit(value)
    @balance += value
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    self.balance > 0 && self.status == 'open' ? true: false
    # if self.balance > 0 && self.status == "open"
    #   return true
    # else
    #   return false
    # end

    #asdfsadfasdf
    # return self.balance > 0 && self.status == "open" ? true:false
    # return  self.balance && self.status
  end

  def close_account
      self.status = "closed"
    #$$$$$
  end

end
