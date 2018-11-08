require './lib/bank'
# Printer class
class Printer
  attr_reader :bank, :history

  def initialize
    @history = []
  end

  def statement
    puts 'date || credit || debit || balance'
    history.reverse_each do |hash|
      puts "#{hash[:date].strftime('%d/%m/%Y')}" ' || '\
        "#{format('%.2f', hash[:credit])}" ' || '\
        "#{format('%.2f', hash[:debit])}" ' || '\
        "#{format('%.2f', hash[:balance])}"
    end
  end
end
