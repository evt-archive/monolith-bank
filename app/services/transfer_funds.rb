class TransferFunds
  attr_accessor :to_account, :from_account, :amount

  def self.call(from_account,to_account, amount)
    instance = new(from_account, to_account, Integer(amount))
    instance.()
  end

  def initialize(from_account, to_account, amount)
    @from_account = from_account
    @to_account = to_account
    @amount = amount
  end

  def call
    return false if insufficient_funds

    @from_account.balance -= amount
    @to_account.balance += amount

    @from_account.save
    @to_account.save
    return true
  end

  def insufficient_funds
    @from_account.balance < amount
  end
end