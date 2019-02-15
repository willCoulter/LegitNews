for i in 1..50
  name = Faker::Name.name
  email = Faker::Internet.safe_email(name)

  user = User.new
  user.name = name
  user.email = email

  if user.save
    p "Saved user ##{i}: #{name} (#{email})"
      article = Article.new
      article.user = user
      article.title = Faker::Lorem.sentence
      article.content = Faker::Lorem.paragraph
      if article.save
        p "Article ##{i} saved for #{name}"
      else
        p article.errors
      end
  else
    p user.errors
  end
end