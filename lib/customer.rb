class Customer
  attr_reader :name

  @@customers = []

  def self.all
  	@@customers
  end

  def self.find_by_name(name)
  	@@customers.each do |customer|
  	  if customer.name == name
  	    return customer
  	  end
  	end
  	# Didn't find anything
  	return nil
  end

  def initialize(options={})
  	@name = options[:name]
  	@purchases = []
  	add_customer
  end

  def purchase(product)
  	Transaction.new self, product
  	@purchases << product
  end

  def purchases
  	@purchases.each do |product|
  	  puts product.title
  	end
  end

  def total_spent
  	@purchases.inject(0) { |total, product| total + product.price  }
  end

  private 

  def add_customer
  	# Check to see if the customer name is unique
  	if self.class.find_by_name(@name) != nil
  		raise DuplicateCustomerError, "'#{@name}' already exists."
  	end

  	# New customer, add them to the list
  	@@customers << self
  end

end