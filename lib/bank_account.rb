class BankAccount

  attr_reader :name
  attr_accessor :balance, :status

  @@all = []

  def initialize(name, balance=1000, status="open")
    @name = name
    @balance = balance
    @status = status
    @@all << self
  end

  def deposit(num)
    @balance += num
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    # binding.pry
    if @status == "open" && @balance > 0
      true
    else
      false
    end
  end

  def close_account
    @status = "closed"
  end

  def self.all
    @@all
  end

end
