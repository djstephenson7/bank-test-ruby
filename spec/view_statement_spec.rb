require 'printer'
require 'bank'
require 'timecop'

describe Printer do
  before do
    Timecop.freeze(Date.today)
  end
  describe 'Bank statement' do
    it 'the user sees an ugly table' do
      bank = Bank.new
      bank.deposit(1000)
      expect { bank.statement }
        .to output("date || credit || debit || balance\n08/11/2018 || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end
end
