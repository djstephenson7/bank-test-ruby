require 'bank'

describe 'statement' do
  it 'the user sees an ugly table' do
    subject.deposit(1000)
    subject.deposit(2000)
    subject.withdraw(500)
    expect(subject.statement).to eq('date || credit || debit || balance')
  end
end
