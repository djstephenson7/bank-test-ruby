require 'bank'

describe Bank do
  describe 'Bank statement' do
    it 'the user sees an ugly table' do
      subject.deposit(1000)
      expect { subject.statement }
        .to output("date || credit || debit || balance\n07/11/2018 || 1000.00 || 0.00 || 1000.00\n").to_stdout
    end
  end
end
