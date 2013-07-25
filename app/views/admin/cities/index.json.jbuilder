json.array!(@cities) do |city|
  json.extract! city, :alias, :name
  json.url city_url(city, format: :json)
end
