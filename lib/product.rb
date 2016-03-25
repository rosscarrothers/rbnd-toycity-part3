class Product
  attr_reader :title
  attr_reader :price
  attr_reader :stock

  @@products = []

  def self.all
  	@@products
  end

  def self.in_stock
  	# Loop over all products in the class list and check which are in stock
  	in_stock_products = []
  	@@products.each do |product|
  		if product.in_stock?
  			in_stock_products << product
  		end
  	end
  	return in_stock_products
  end

  def self.find_by_title(title)
  	# Loop over the list of current products and compare their title with the one given
  	@@products.each do |product|
  	  if product.title == title
  	  	return product
  	  end
  	end

  	# Didn't find anything
  	return nil
  end

  def initialize(options={})
  	@title = options[:title]
  	@price = options[:price]
  	@stock = options[:stock]
  	add_to_products
  end

  def in_stock?
  	@stock != nil && @stock > 0
  end

  def purchase
  	if in_stock?
  	  @stock -= 1
  	else
  	  raise OutOfStockError, "'#{title}' is out of stock"
  	end 
  end

  private 

  def add_to_products
  	# Check to see if the product title is unique
  	if self.class.find_by_title(@title) != nil
  	  raise DuplicateProductError, "'#{@title}' already exists"
  	end

  	# New product, add it to the list
  	@@products << self
  end

end