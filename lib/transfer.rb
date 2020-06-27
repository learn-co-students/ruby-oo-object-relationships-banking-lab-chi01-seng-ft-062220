class Transfer
  # your code here
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  @@all = []
  def initialize(sender, receiver, amount)
    @amount = amount
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @@all << self
  end
  def self.all
    @@all
  end
  def valid?
    self.sender.valid? && self.receiver.valid?   
  end  
  def execute_transaction    
  end    
end
