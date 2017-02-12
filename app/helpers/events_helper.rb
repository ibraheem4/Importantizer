module EventsHelper
  def get_user_info(id, token)
    response = HTTParty.get("https://api.flock.co/v1/users.getPublicProfile?token=#{token}&userId=#{id}")
    body = response.body
    {
      id: body['id'],
      first_name: body['firstName'],
      last_name: body['lastName'],
      profile_image: body['profileImage']
     }
  end
end
