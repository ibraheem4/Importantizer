class EventsController < ApplicationController
  include HTTParty
  
  def index
    p "Index page"
  end

  def create
    p "*" * 10
    text = params[:text]
    command = params[:command]
    user_id = params[:userId]
    method_name = params[:name]
    if command == 'imp'
      send_message(user_id,text)
      p 'command is imp!'
    end
    if method_name == 'app.install'
      p 'app install called!'
      token = params[:token]
      # delete old tokens
      # old_events = Event.where(user_id: user_id)
      # old_events.destroy_all
      Event.create!(user_id: user_id, token: token)
    else method_name == 'app.uninstall'
      event = Event.find_by(user_id: user_id)
      # event.destroy
    end
    # @base_url = 'https://api.flock.co/v1'
    # @method = '/chat.sendMessage'
    # token ="6d58df16-4c29-4004-88f4-f8dcaa162ff5"
    # user_id = "u:mwprywsytyyry4r7"
    # text = 'brahbrahh'
    # url = @base_url + @method
    # p response = HTTParty.post(url, query:{
    #   'to' => user_id,
    #   'token' => token,
    #   'text' => text
    #   })
    render :nothing => true, :status => 200
  end

  def send_message(user_id,text)
    @base_url = 'https://api.flock.co/v1'
    @method = '/chat.sendMessage'
    p '*' * 10
    p event = Event.find_by(user_id: user_id)
    p token = event.token
    url = @base_url + @method
    p response = HTTParty.post(url, query:{
      'to' => user_id,
      'token' => token,
      'text' => text
      })
  end
end