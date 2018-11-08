require 'bank'

describe Bank do
  before do
    Bank.any_instance.stub(:puts)
  end

  describe '#deposit' do
    it 'Can credit money to the balance' do
      expect { subject.deposit(1000) }.to change(subject, :balance).by(+1000)
    end

    it 'Displays a deposit transaction hash' do
      subject.deposit(100)
      expect(subject.history)
        .to eq([debit: 0, credit: 100, balance: 100, date: Date.today])
    end
  end

  describe '#withdraw' do
    it 'Can debit money from the balance' do
      subject.deposit(150)
      expect { subject.withdraw(100) }.to change(subject, :balance).by(-100)
    end

    it 'Displays a withdraw transaction hash' do
      subject.deposit(100)
      subject.withdraw(50)
      expect(subject.history)
        .to eq([{ balance: 100, credit: 100, debit: 0, date: Date.today },
                { balance: 50, credit: 0, debit: 50, date: Date.today }])
    end

    it 'raises an error if the user goes below 0' do
      subject.deposit(10)
      expect { subject.withdraw(15) }.to raise_error('Insufficient balance!')
    end
  end
end
