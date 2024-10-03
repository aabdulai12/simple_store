require 'csv'

Product.destroy_all
Category.destroy_all

csv_file = Rails.root.join('db/products.csv')
csv_data = File.read(csv_file)

products = CSV.parse(csv_data, headers: true)

products.each do |row|
  category_name = row['category']
  category = Category.find_or_create_by(name: category_name)

  category.products.create(
    title: row['name'],
    price: row['price'],
    stock_quantity: row['stock_quantity']
  )
end
