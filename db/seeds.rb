require 'csv'

# Clear existing data
Product.destroy_all
Category.destroy_all

# Load data from CSV file
csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)
products = CSV.parse(csv_data, headers: true)

# Parse each row and create products and categories
products.each do |row|
  # Find or create the category
  category_name = row['category'] # Adjust according to your CSV file headers
  category = Category.find_or_create_by(name: category_name)

  # Create the product associated with the category
  Product.create(
    title: row['name'],             # Adjust column names to match your CSV file headers
    price: row['price'],
    stock_quantity: row['stock_quantity'],
    category: category
  )
end

puts "Database seeded with #{Product.count} products and #{Category.count} categories."
