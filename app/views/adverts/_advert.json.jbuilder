json.extract! advert, :id, :title, :city, :street, :phone, :created_at, :updated_at
json.url advert_url(advert, format: :json)
