@entries ||= @day.entries.not_archived
json.partial! "days/day", {
  day: @day,
  entries: @entries.order('datetime asc')
}
