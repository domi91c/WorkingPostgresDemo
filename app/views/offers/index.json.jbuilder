json.array!(@offers) do |offer|
  json.extract! offer, :id, :title, :description
  json.url offer_url(offer, format: :json)
end
