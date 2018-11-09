require './lib/bank'
# Printer class
class Printer
  def statement(his)
    puts 'date || credit || debit || balance'
    his.reverse_each do |hash|
      puts "#{hash[:date].strftime('%d/%m/%Y')}" ' || '\
        "#{format('%.2f', hash[:credit])}" ' || '\
        "#{format('%.2f', hash[:debit])}" ' || '\
        "#{format('%.2f', hash[:balance])}"
    end
  end
end
