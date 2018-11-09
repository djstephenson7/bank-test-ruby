require 'overdraft'
describe Overdraft do
  # Arrange
  describe 'overdraft facilities' do
    it 'has a starting value of 0' do
      # Act
      # Assert
      expect(subject.default_limit).to eq 0
    end
  end

  # Arrange
  describe '#set_limit' do
    it 'allows the user to set their overdraft limit by passing an argument' do
      # Act
      # Assert
      subject.set_limit(-50)
      expect(subject.customer_limit).to eq(-50)
    end
  end
end
