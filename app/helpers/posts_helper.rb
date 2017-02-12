module PostsHelper
  include TextSummarizerHelper
  include Twilio



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
    output.flatten!

    output.sort_by(&:created_at)
  end

  def display_without_key_words
    Important.all.sort_by(&:created_at)
  end

  def summarize
    get_summary(make_to_text)
  end

  def send_message(phone_number, alert_message)
    client = Twilio::REST::Client.new ENV['TWILIO_NUMBER'], ENV['TWILIO_AUTH_TOKEN']

    client.messages.create(
    from: "+1 985-241-6556",
    to: phone_number,
    body: alert_message,
    # media_url: image_url
    )
  end

  private
  def key_words(arr)
    output = []
    arr.each do |word|
      output << Post.all.select{|post| /#{word.downcase}/.match(post.text.downcase) != nil}
    end
    output.flatten.uniq
  end


end
