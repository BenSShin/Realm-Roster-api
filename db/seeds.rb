# # group seed
# group = Group.create!([{ name: "roll" }, { name: "nat20" }])
# # user seed
# user = User.create!([
#   { username: "Ben", email: "ben@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
#   { username: "hi", email: "hi@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
#   { username: "alex", email: "alex@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
#   { username: "test", email: "test@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
# ])
# # message seed
# message = Message.create!([{ group_id: 1, user_id: 2, content: "hello" }, { group_id: 1, user_id: 1, content: "hello" }, { group_id: 1, user_id: 2, content: "How you doing?" }, { group_id: 1, user_id: 1, content: "Good" }])

# # spell seed from dnd5eapi
# response = HTTP.get("https://www.dnd5eapi.co/api/spells")
# data = JSON.parse(response)
# spellarray = data["results"]
# spellarray.each do |spell_index|
#   url = spell_index["url"]
#   response = HTTP.get("https://www.dnd5eapi.co#{url}")
#   data = JSON.parse(response)
#   components = []
#   data["components"].each do |c|
#     components << c
#   end
#   if data["dc"]
#     dc_type = data["dc"]["dc_type"]["name"]
#   end
#   if data["damage"]
#     if data["damage"]["damage_type"]
#       damage_t = data["damage"]["damage_type"]["name"]
#     end
#   end
#   if data["area_of_effect"]
#     area = data["area_of_effect"]
#   end
#   classes = []
#   data["classes"].each do |cl|
#     classes << cl["name"]
#   end
#   subclasses = []
#   data["subclasses"].each do |sub|
#     subclasses << sub["name"]
#   end
#   spell = Spell.create!(
#     name: data["name"],
#     description: data["desc"][0],
#     higher_level: data["higher_level"][0],
#     range: data["range"],
#     components: components,
#     material: data["material"],
#     ritual: data["ritual"],
#     duration: data["duration"],
#     concentration: data["concentration"],
#     casting_time: data["casting_time"],
#     level: data["level"],
#     dc_type: dc_type,
#     attack_type: data["attack_type"],
#     damage_type: damage_t,
#     school: data["school"]["name"],
#     classes: classes,
#     subclasses: subclasses,
#     url: data["url"],
#     area_of_effect: area,
#   )
# end
