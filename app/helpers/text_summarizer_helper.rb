module TextSummarizerHelper
  include HTTParty
  def get_summary(string)
    base_url = "https://textanalysis-text-summarization.p.mashape.com/text-summarizer-text"
    p '*' * 10
      api_key = ENV["TS_API"]
    p response = HTTParty.post(
        base_url,
        headers: {
          "X-Mashape-Key" => api_key,
          "Content-Type" => "application/x-www-form-urlencoded",
          "Accept" => "application/json"
        },
        body: {
          "sentnum" => 4,
          "text" => string
        }
      )
    response["sentences"]
  end
end