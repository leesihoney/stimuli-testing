json.extract! recipient, :id, :organization_size, :food_access, :income_level, :poverty_level, :last_donation, :total_donation, :travel_time, :created_at, :updated_at
json.url recipient_url(recipient, format: :json)
