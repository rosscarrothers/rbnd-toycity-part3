class Transaction
  attr_reader :id
  attr_reader :customer
  attr_reader :product

  @@transactions = []

  def self.all
  	@@transactions
  end

  def self.find(transaction_number)
  	@@transactions[transaction_number - 1]
  end

  def initialize(customer, product)
  	# First make sure the purchase is valid (item is in stock)
  	product.purchase

  	# Set the instance variables and add this class to the transactions log
    @customer = customer
    @product = product
    @id = @@transactions.count + 1
    @@transactions << self
  end

end