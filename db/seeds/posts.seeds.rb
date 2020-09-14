file = Psych.load_file("db/seeds/posts.yml")
file["posts"].each do |params|
  Post.find_or_create_by(params)
end