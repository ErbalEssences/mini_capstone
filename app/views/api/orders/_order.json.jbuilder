json.user_id order.user_id

json.subtotal order.subtotal
json.tax order.tax
json.total order.total
json.order_number order.id

json.product do
  json.partial! order.product, partial: "api/products/product", as: :product
end