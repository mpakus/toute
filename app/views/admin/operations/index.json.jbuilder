json.array!(@operations) do |operation|
  json.extract! operation, :alias, :name
  json.url operation_url(operation, format: :json)
end
