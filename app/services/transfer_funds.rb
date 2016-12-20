class TransferFunds
  attr_accessor :to_account, :from_account, :amount, :memo

  def self.call(from_account,to_account, amount, memo)
    instance = build(from_account, to_account, amount, memo)
    instance.()
  end

  def self.build(from_account, to_account, amount, memo = nil)
    memo ||= ""
    new(from_account, to_account, Integer(amount), memo)
  end

  def initialize(from_account, to_account, amount, memo)
    @from_account = from_account
    @to_account = to_account
    @amount = amount
    @memo = memo
  end

  def call
    return false if insufficient_funds?

    from_account.balance -= amount
    to_account.balance += amount

    from_account.funds_transfers.create(memo: memo, 
                                        to: to_account, 
                                        amount: amount)

    from_account.save
    to_account.save
    return true
  end

  def insufficient_funds?
    from_account.balance < amount
  end
end