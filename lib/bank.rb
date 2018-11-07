require 'table_print'

# The bank class
class Bank
  attr_reader :balance, :history, :transaction

  def initialize
    @balance = 0
    @transaction = { debit: 0, credit: 0, balance: 0, date: Date.today.to_s }
    @history = []
  end

  def deposit(money)
    @balance += money
    record_deposit(money)
    puts @transaction
    store_transaction
  end

  def withdraw(money)
    raise 'Insufficient balance!' if money > @balance

    @balance -= money
    record_withdrawal(money)
    puts @transaction
    store_transaction
  end

  def statement
    tp @history.reverse
  end

  private

  def record_deposit(money)
    @transaction[:balance] = @balance
    @transaction[:credit]  = money
    @transaction[:date]    = Date.today.to_s
  end

  def record_withdrawal(money)
    @transaction[:balance] = @balance
    @transaction[:debit] = money
    @transaction[:date] = Date.today.to_s
  end

  def store_transaction
    @history << @transaction
    @transaction = { debit: 0, credit: 0, balance: 0, date: Date.today.to_s }
  end
end
