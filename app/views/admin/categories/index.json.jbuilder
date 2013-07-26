json.array!(@categories) do |category|
  json.extract! category, :alias, :name
  json.url category_url(category, format: :json)
end
