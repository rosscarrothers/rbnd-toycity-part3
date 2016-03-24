class Product
  attr_reader :title

  @@products = []

  def initialize(options={})
  	@title = options[:title]
  	add_to_products
  end

  def self.all
  	@@products
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