require 'bank'
require 'printer'

describe Bank do
  let(:statement_printer) { double(:statement) }
  let(:subject) { Bank.new(statement_printer) }

  before do
    Bank.any_instance.stub(:puts)
  end

  describe '#deposit' do
    it 'Can credit money to the balance' do
      expect { subject.deposit(1000) }.to change(subject, :balance).by(+1000)
    end
  end

  describe '#withdraw' do
    it 'Can debit money from the balance' do
      subject.deposit(150)
      expect { subject.withdraw(100) }.to change(subject, :balance).by(-100)
    end

    it 'raises an error if the user goes below 0' do
      subject.deposit(10)
      expect { subject.withdraw(15) }.to raise_error('Insufficient balance!')
    end
  end

  describe '#print_statement' do
    it 'stores the user overdraft limit' do
      overdraft = double(:overdraft)
      allow(overdraft).to receive(:new_limit).and_return(-100)
      expect(subject.set_overdraft).to eq 100
    end
  end

  describe 'print statements' do
    it 'prints a vile table' do
      subject.deposit(1000)
      expect(statement_printer).to receive(:statement)
      subject.print_statement
    end
  end
end
