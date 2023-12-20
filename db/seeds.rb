group = Group.create!([{ name: "roll" }, { name: "nat20" }])
user = User.create!([
  { username: "Ben", email: "ben@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "hi", email: "hi@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "alex", email: "alex@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
  { username: "test", email: "test@gmail.com", password: "test", password_confirmation: "test", group_id: 1 },
])
