json.extract! order, :id, :date, :shipping_address, :billing_address, :status, :amount, :laptop_id, :customer_id, :created_at, :updated_at
json.url order_url(order, format: :json)
