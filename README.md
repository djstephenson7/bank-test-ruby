# Bank Tech Test

This is a short Bank class that allows the user to interact with it using the command line. Users can deposit, withdraw and view their transaction history through their REPL.

### User stories

This app was created to fulfil requirements put forward in: https://github.com/makersacademy/course/blob/master/individual_challenges/bank_tech_test.md

To break down the problem into manageable steps, I separated them into 'User Stories' in my notes, which can be found below.

```
As a customer,
So I can accurately keep track of my finances,
I'd like my balance to start at 0.

As a customer,
So I can safely store my money,
I'd like to be able to deposit money in my bank account.

As a customer,
So I have proof of deposit,
I'd like a receipt to be printed on deposit.

As a customer,
So I can access my money when I need it,
I'd like to be able to withdraw my money.

As a customer,
So I have proof of withdrawal,
I'd like a receipt to be printed on withdrawal.

As a customer,
So I don't fall into financial ruin,
I'd like to avoid my balance going below 0.

As a customer,
So I can accurately keep track of my spending,
I'd like to see my transaction history in a simple table.
```

## Getting Started

To get started with this project, please fork this repo and run 'git clone', along with the URL for this repo, in your command line to get a copy of this repo on your machine.

### Installing

This file comes with a few gems that must be installed on your machine before you can started using it.

Open your command line and run these two commands:

```
gem install bundler
bundle install
```

And that's it, you're ready to go!

## Running the tests

My code uses RSpec for the unit tests and SimpleCov to measure test coverage. To run the test, cd into the root directory and run 'rspec' in your command line.

### Test Breakdown

My test are testing the methods in the Bank class to ensure that they are outputting the correct things to the terminal. In the example below, the tests are ensuring that whenever the user opens their REPL, the balance starts at 0.

```
describe 'balance' do
  it 'Has a starting balance of £0' do
    expect(subject.balance).to eq 0
  end
```

### How to use

This program runs entirely through your machine's REPL (the most popular choices are either IRB or PRY). To open the app, cd to the root directory and type in either 'irb' or 'pry'.

#### Before interacting

```
require './lib/bank.rb'
require 'date'
bank = Bank.new
```
#### List of commands

```
bank.deposit(Integer)
bank.withdraw(Integer)
bank.statement
```

#### Screenshot

<img width="352" alt="screenshot 2018-11-07 at 11 44 38" src="https://user-images.githubusercontent.com/41509062/48129818-8d5b5900-e282-11e8-8690-e0c3405b746b.png">


## Contributing

If you wish to contribute to this repo, please fork, clone and submit a pull request and I'll be happy to review it.

## Authors

* **Daniel Stephenson**

## License

This project is licensed under the MIT License - see the [LICENSE.md](LICENSE.md) file for details

## Acknowledgments

* A special thank you to RSpec for keeping me on the straight and narrow!
