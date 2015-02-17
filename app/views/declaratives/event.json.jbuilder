json.array! @events do |event|
  json.id event.id
  json.title event.declarativetext
  json.allday true
  json.start event.reviewdate
  json.update event.updated_at
  json.url edit_user_declarative_url(event.user_id, event.id)
end