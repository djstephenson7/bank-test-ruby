require 'bank'

describe Bank do
  before do
    Bank.any_instance.stub(:puts)
  end

  describe 'balance' do
    it 'Has a starting balance of £0' do
      expect(subject.balance).to eq 0
    end

    it 'Has a transaction history' do
      expect(subject.transaction).to include(:debit, :credit, :balance, :date)
    end
  end

  describe '#deposit' do
    it 'Can credit money to the balance' do
      expect { subject.deposit(1000) }.to change(subject, :balance).by(+1000)
    end

    it 'Displays a deposit transaction hash' do
      subject.deposit(100)
      expect do
        print(debit: 0, credit: 100, balance: 100, date: Date.today.to_s)
      end.to output.to_stdout
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
      expect do
        print(debit: 50, credit: 100, balance: 50, date: Date.today.to_s)
      end.to output.to_stdout
    end

    it 'raises an error if the user goes below 0' do
      subject.deposit(10)
      expect { subject.withdraw(15) }.to raise_error('Insufficient balance!')
    end
  end
end
