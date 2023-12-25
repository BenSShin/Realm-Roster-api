# group seed
group = Group.create!([{ name: "roll" }, { name: "nat20" }])
# user seed
user = User.create!([
  { username: "Ben", email: "ben@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "hi", email: "hi@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "alex", email: "alex@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "test", email: "test@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
])
# message seed
message = Message.create!([{ group_id: 1, user_id: 2, content: "hello" }, { group_id: 1, user_id: 1, content: "hello" }, { group_id: 1, user_id: 2, content: "How you doing?" }, { group_id: 1, user_id: 1, content: "Good" }])

# spell seed from dnd5eapi
# response = HTTP.get("https://www.dnd5eapi.co/api/spells")
# data = JSON.parse(response)
# spellarray = data.results
# spellarray.each do |spell_index|

# end
