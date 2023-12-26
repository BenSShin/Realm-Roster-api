json.id user.id
json.username user.username
json.characters user.characters, partial: "characters/character", as: :character
json.email user.email
json.profile_picture user.profile_picture
json.created_at user.created_at
json.updated_at user.updated_at
