json.array!(@touts) do |tout|
  json.extract! tout, :name, :content, :option_id, :category_id, :city_id, :user_id, :deleted
  json.url tout_url(tout, format: :json)
end
