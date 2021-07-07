class BankAccount
  attr_accessor :balance, :status

  def initialize(name, balance = 1000, status = "open")
    @name = name
    @balance = balance
    @status = status
  end

  def name
    @name
  end

  def deposit(amount)
    @balance += amount
  end

  def display_balance
    "Your balance is $#{self.balance}."
  end

  def valid?
    if (self.balance > 0) && (self.status=="open")
      true
    else
      self.status = "closed"
      false
    end
  end

  def close_account
    self.status = "closed"
  end


end
