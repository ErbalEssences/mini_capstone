json.user_id order.user_id
json.product_id order.product_id
json.individual_price number_to_currency(order.product.price)
json.quantity order.quantity

# json.subtotal order.subtotal
# json.tax order.tax
# json.total order.total
json.subtotal number_to_currency(order.subtotal)
json.tax number_to_currency(order.tax)
json.total number_to_currency(order.total)
# json.formated do
#   json.subtotal number_to_currency(order.subtotal)
#   json.tax number_to_currency(order.tax)
#   json.total number_to_currency(order.total)
# end

json.product_name order.product.name
json.order_number order.id

# json.product do
#   json.partial! order.product, partial: "api/products/product", as: :product
# end