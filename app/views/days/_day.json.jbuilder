json.extract! day, :id, :user_id, :title, :created_at, :updated_at
json.url day_url(day, format: :json)

json.array! day.entries, partial: 'entries/entry', as: :day
