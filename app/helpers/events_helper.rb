module EventsHelper
  def get_user_info(id, token)
    response = HTTParty.get("https://api.flock.co/v1/users.getPublicProfile?token=#{token}&userId=#{id}")
    {
      id: response['id'],
      first_name: response['firstName'],
      last_name: response['lastName'],
      profile_image: response['profileImage']
     }
  end
end
