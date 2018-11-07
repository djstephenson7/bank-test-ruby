# The bank class
class Bank
  attr_reader :balance, :history, :transaction

  def initialize
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

  def statement
    puts 'date || credit || debit || balance'
    @history.reverse_each do |hash|
      puts "#{hash[:date].strftime('%d/%m/%Y')}" ' || '\
        "#{format('%.2f', hash[:credit])}" ' || '\
        "#{format('%.2f', hash[:debit])}" ' || '\
        "#{format('%.2f', hash[:balance])}"
    end
  end

  private

  def record_deposit(money)
    @transaction[:balance] = @balance
    @transaction[:credit]  = money
    @transaction[:date]    = Date.today
  end

  def record_withdrawal(money)
    @transaction[:balance] = @balance
    @transaction[:debit] = money
    @transaction[:date] = Date.today
  end

  def store_transaction
    @history << @transaction
    @transaction = { date: Date.today, credit: 0, debit: 0, balance: 0 }
  end
end
