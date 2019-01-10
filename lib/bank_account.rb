class BankAccount
    attr_accessor :status, :balance, :transfer

    def initialize(name)
        @name=name
        @status="open"
        @balance=1000
    end

    def name
        @name
    end

    def deposit(money)
        @balance+=money
    end

    def display_balance
        "Your balance is $#{balance}."
    end

    def valid?
        if status == "open" && balance > 0 
                true
        elsif status == "closed"
                false
        else
            false
        end
    end
    
    def close_account
        @status="closed"
    end
end
