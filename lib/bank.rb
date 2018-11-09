require './lib/printer'
require 'date'

# The bank class
class Bank
  attr_reader :balance, :history

  def initialize(printer = Printer.new)
    @printer = printer
    @balance = 0
    @transaction = { date: Date.today, credit: 0, debit: 0, balance: 0 }
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

  def print_statement
    @printer.statement(@history)
  end

  private

  def record_deposit(money)
    @transaction[:balance] = @balance
    @transaction[:credit]  = money
    @transaction[:date]    = Date.today
  end

  def record_withdrawal(money)
    @transaction[:balance] = @balance
    @transaction[:debit]   = money
    @transaction[:date]    = Date.today
  end

  def store_transaction
    @history << @transaction
    @transaction = { date: Date.today, credit: 0, debit: 0, balance: 0 }
  end
end
