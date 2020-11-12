class Transfer
  attr_accessor :status, :amount, :sender, :receiver

  def initialize(sender, receiver, amount, status = "pending")
    @status = status
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.status == "complete"
      sender.balance += amount
      receiver.balance -= amount
      self.status = "reversed"
    end
  end


  


end
