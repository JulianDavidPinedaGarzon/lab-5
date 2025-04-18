Message.delete_all
Chat.delete_all
User.delete_all


users = 10.times.map do
  User.create!(
    email: Faker::Internet.email,
    first_name: Faker::Name.first_name,
    last_name: Faker::Name.last_name
  )
end


chats = 10.times.map do
  sender, receiver = users.sample(2)
  Chat.create!(
    sender_id: sender.id,
    receiver_id: receiver.id
  )
end

10.times do
  chat = chats.sample
  user = users.sample
  Message.create!(
    chat_id: chat.id,
    user_id: user.id,
    body: Faker::Lorem.sentence
  )
end
