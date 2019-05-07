json.id product.id
json.name product.name
json.price product.price
json.image_url product.image_url
json.description product.description
json.material product.material
# json.type product.type
json.style product.style

json.is_discounted product.is_discounted?
json.tax product.tax
json.total product.total

json.formated do
  json.price number_to_currency(product.price)
  json.tax number_to_currency(product.tax)
  json.total number_to_currency(product.total)
end