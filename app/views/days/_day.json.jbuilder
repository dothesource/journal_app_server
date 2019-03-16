json.extract! day, :id, :user_id, :title, :created_at, :updated_at
json.url day_url(day, format: :json)

json.entries do
  json.array! day.entries, partial: 'entries/entry', as: :entry
end
