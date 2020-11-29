class BankAccount
    attr_accessor :balance, :status
    attr_reader :name
    @@all = []
    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
        @@all << self
    end
    def self.all
        @@all
    end
    def deposit(money)
        self.balance += money
    end
    def display_balance
        "Your balance is $#{balance}."
    end
    def valid?
        balance > 0 && status == "open"             
    end    
    def close_account
        @@all = []
        self.status = "closed"
    end        
end