# Product.create!([
#   {name: "Mountain Necklace", price: "56.0", image_url: "https://cdn.shopify.com/s/files/1/0432/0977/products/FullSizeRender_91.jpg?v=1512687260", description: "Gold necklace shaped like a mountain.", material: "metal", style: "short ", in_stock: true},
#   {name: "Botanical Necklace", price: "20.0", image_url: "https://cdn.shopify.com/s/files/1/0671/4161/products/N1321-silver-purple-queen-annes-lace_1024x1024.jpg?v=1500989319", description: "Necklace with purple flower in resin.", material: "resin, flower, and metal", style: "long", in_stock: true},
#   {name: "Gold and Pink Earings", price: "14.0", image_url: "https://cdn.shopify.com/s/files/1/0671/4161/products/E1119-goldfill-ruby-shop_1024x1024.jpg?v=1508715741", description: "Short dangle, gold and pink earings. Metal with pink gems.", material: "metal", style: "short dangle", in_stock: true},
#   {name: "Turquoise Hexigon", price: "26.0", image_url: "https://starfishproject.com/wp-content/uploads/2017/06/126-038g_earrings-2.jpg", description: "Turquoise hexigon shaped stud earings.", material: "metal and turquoise", style: "stud", in_stock: true}
# ])

# Supplier.create!([
#   {name: "Shante", email: "shante@gmail.com", phone_number: "876-366-8754"},
#   {name: "Liese", email: "liese@gmail.com", phone_number: "876-555-8754"},
#   {name: "Other Human", email: "other@gmail.com", phone_number: "876-212-8754"}
# ])

# products = Product.all

# products.each do |product|
#   image = Image.create({url: product.image_url, product_id: product.id})
#   image.save
# end
# or
# product.all.each {|product| Image.create(url: product.image_url, product_id: product.id)}


  # image = Image.create({url: "https://images-na.ssl-images-amazon.com/images/I/31RT0OMIJ6L.jpg", product_id: 1})
  # image.save


  # image = Image.create({url: "https://cdn.shopify.com/s/files/1/0864/0890/products/High_Low_Mountain_Necklace_grande.png?v=1522653192", product_id: 1})
  # image.save