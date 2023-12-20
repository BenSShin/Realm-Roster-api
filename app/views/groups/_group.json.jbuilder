json.id group.id
json.name group.name
json.users group.users, partial: "users/user", as: :user
json.messages group.messages, partial: "messages/message", as: :message
json.meetup group.meetup
json.locatin group.location
json.created_at group.created_at
json.updated_at group.updated_at
