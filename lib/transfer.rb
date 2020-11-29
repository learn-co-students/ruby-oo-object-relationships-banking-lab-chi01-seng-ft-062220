class Transfer
  attr_accessor :sender, :receiver, :status, :amount
  @@all = []

  def initialize(sender, receiver, status="pending", amount)
    @sender = sender
    @receiver = receiver
    @status = status
    @amount = amount
    @@all << self
  end

  def self.all
    @@all
  end

  def valid?
    sender.valid? == true && receiver.valid? == true ? true : false
  end

  def execute_transaction
      if self.valid? == true  && sender.balance >= amount && self.status != "complete"
      receiver.deposit(amount) && sender.deposit(-amount)
      @status = "complete"
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @@all.include?(self) && self.status == "complete"
      receiver.deposit(-amount) && sender.deposit(amount)
      @status = "reversed"
    end
  end
end
