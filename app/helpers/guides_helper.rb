module GuidesHelper
  def find_user_name(user_id)
    if user_id
      User.find(user_id).name
    else
      "Anonymous"
    end
  end

  def find_user user_id
    if user_id
      User.find(user_id)
    else
      "/"
    end
  end


end
