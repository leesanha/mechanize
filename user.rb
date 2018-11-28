require 'mechanize'

agent = Mechanize.new
page = agent.get("https://uni.likelion.org")

my_page = page.form_with(:action => "/users/sign_in") do |f|
    f.field_with(:name => "user[email]").value = "bluegisa@likelion.org"
    f.field_with(:name => "user[password]").value = "tksgk930"
end.submit

page2 = agent.get("https://uni.likelion.org/users/94")
name = page2.search("#main > header > div > div > h1").map(&:text)
email = page2.search("#main > header > div > p:nth-child(2) > span").map(&:text)
subtitle = page2.search("#main > header > div > p.meta.mt-2 > span").map(&:text)
content = page2.search("#main > section > div > section > div").map(&:text)
# num = page2.search("#main > header > div > div > h1").map(&:text)

puts name + email + subtitle + content