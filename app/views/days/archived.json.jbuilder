json.array! @days do |day|
  json.partial! "days/day", {
    day: day,
    entries: day.entries.archived.order('datetime asc')
  }
end
