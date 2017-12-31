
##create users
20.times do
  name = Faker::Name.first_name
  User.create(
    name: name,
    username: Faker::Internet.user_name(name),
    email: Faker::Internet.email(name),
    password: Faker::Internet.password(6, 20)
  )
end

keywords = [
  'Pastel & Pale', 'Window', 'City', 'Food', 'Blur', 'Nature', 'Flower', 'People', 'Portraits',
  'Earth Tones', 'Flatlays', 'Textures', 'Neon', 'Colour', 'In Motion', 'Snow & Winter'
]

def create_pictures(array_of_boards, word, page_num)
  ##gets 30 photos for passed in page_num argument
  array_of_photos = Unsplash::Photo.search(word, page = page_num, per_page = 30)
  ##creates pictures and associates each picture with an existing board for that specific keyword
  array_of_photos.each do |photo|
    photo = Picture.create(
      url: photo.urls.small,
      photographer_name: photo.user.name,
      photographer_link: "#{photo.user.links.html}?utm_source=Blush&utm_medium=referral",
      keyword: word
    )
    PictureBoard.create(
      picture_id: photo.id,
      board_id: array_of_boards.shuffle.first.id
    )
  end
end

keywords.map do |word|
  ##makes 5 boards for each keyword and assigns to a random users
  boards = []
  5.times do
    board = Board.create(
      user_id: User.all.shuffle.first.id,
      name: word
      )
    boards << board
  end

  ##calls above function 3 times, in order to make 3 queries to Unsplash
  ##passes in specific boards for that keyword, the keyword, and the page_num for the query
  for i in 1..3
    create_pictures(boards, word, i)
  end

end
