class BankAccount
  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end

  attr_reader :name
  attr_accessor :status, :balance

  def deposit(int)
    @balance += int
  end

  def balance=(int)
    @balance = int
  end

  def display_balance
    puts "Your balance is $#{@balance}."
    "Your balance is $#{@balance}."
  end

  def valid?
    return @status == "open" && @balance > 0
  end

  def close_account
    @status = "closed"
  end
end
