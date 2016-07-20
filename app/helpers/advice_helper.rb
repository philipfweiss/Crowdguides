module AdviceHelper
  def get_username(id)
    if id == nil
      "(Anonymous) " + Faker::Color.color_name.capitalize + " " + Faker::Hipster.words[0].capitalize
    else
      user = User.find(id)
      if user.name != nil
        user.name
      else
        "(Anonymous) " + Faker::Color.color_name.capitalize + " " + Faker::Hipster.words[0].capitalize
      end
    end
  end

  def user_link(id)
    if id == nil
      @guide
    else
      user = User.find(id)
      if user != nil
        user
      else
        @guide
      end
    end
  end

end
