class HomeController < ApplicationController
  require 'mechanize'
  def index
  end

  def user_data

    agent = Mechanize.new
    page = agent.get("https://uni.likelion.org")
    
    my_page = page.form_with(:action => "/users/sign_in") do |f|
        f.field_with(:name => "user[email]").value = "bluegisa@likelion.org"
        f.field_with(:name => "user[password]").value = "tksgk930"
    end.submit
    
  1143.downto(1).each do |x|
    begin
      @user = User.new
      page2 = agent.get("https://uni.likelion.org/users/#{x}")
      page2.search("#main > header > div > div > h1").map(&:text).each do |n|
        @user.name = n
      end
      page2.search("#main > header > div > p:nth-child(2) > span").map(&:text).each do |e|
        @user.email = e
      end
      page2.search("#main > header > div > p.meta.mt-2 > span").map(&:text).each do |s|
        @user.subtitle = s
      end
      page2.search("#main > section > div > section > div").map(&:text).each do |c|
        @user.content = c
      end
      @user.number = x
      @user.save
      rescue Mechanize::ResponseCodeError => e
      end
    end
    redirect_to "home/user_view"
    # puts name + email + subtitle + content
  end

  def idea_data
  end

  def user_view
  end

  def idea_view
  end
end
