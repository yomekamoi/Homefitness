json.extract! review, :id, :user_id, :post_id, :description, :created_at, :updated_at
json.url review_url(review, format: :json)
