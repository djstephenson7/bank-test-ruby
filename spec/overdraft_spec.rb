require 'overdraft'
describe Overdraft do
  describe 'overdraft facilities' do
    it 'has a starting value of 0' do
      expect(subject.default_limit).to eq 0
    end
  end

  describe '#set_limit' do
    it 'allows the user to set their overdraft limit by passing an argument' do
      subject.new_limit(-50)
      expect(subject.customer_limit).to eq(-50)
    end
  end
end
