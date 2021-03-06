json.array! @days do |day|
  json.partial! "days/day", {
    day: day,
    entries: day.entries.not_archived.order('datetime asc')
  }
end
