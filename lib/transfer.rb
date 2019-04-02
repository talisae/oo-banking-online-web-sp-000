class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if @sender.valid? == false && @sender.balance < @amount
      "Transaction rejected. Please check your account balance."
      @status = "rejected"
    elsif @status == "complete"
      "Transaction complete."
    else
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    #if @sender.balance < @amount
    #if status = complete , "Your rejected"

    end
  end


end
