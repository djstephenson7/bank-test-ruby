require 'printer'
require 'timecop'

describe Printer do
  before do
    Timecop.freeze('09/11/2018')
  end
  describe 'Bank statement' do
    it 'the user sees an ugly table' do
      expect { subject.statement([{ date: Date.today, credit: 1000, debit: 0, balance: 1000 }]) }
        .to output("date || credit || debit || balance\n09/11/2018 || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end
end
