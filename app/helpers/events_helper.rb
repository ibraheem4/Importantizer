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

  def make_to_text
    Post.all.map(&:text).join('. ')
  end

  def search_arr(string)
    string.split(',').map(&:strip)
  end

  def display_with_key_words(arr)
    output = []
    output << key_words(arr)
    output << Important.all
    output.sort_by(&:created_at)
  end

  def display_without_key_words
    Important.all.sort_by(&:created_at)
  end


  private
  def key_words(arr)
    output = []
    arr.each do |word|
      output << Post.all.select{|post| /#{word}/.match(post.text) != nil}
    end
    output.flatten.uniq
  end
end
