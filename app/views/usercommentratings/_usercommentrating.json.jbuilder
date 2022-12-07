json.extract! usercommentrating, :id, :star, :created_at, :updated_at
json.url usercommentrating_url(usercommentrating, format: :json)
