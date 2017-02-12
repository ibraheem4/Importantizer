class EventsController < ApplicationController
  include HTTParty
  include EventsHelper
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
      # save the important text in DB
      Important.create(user_id: user_id, text: text)
      p 'command is imp!'
      render :nothing => true, :status => 200
    elsif method_name == 'app.install'
      p 'app install called!'
      token = params[:token]
      # delete old tokens
      old_events = Event.where(user_id: user_id)
      old_events.destroy_all
      Event.create!(user_id: user_id, token: token)
      render :nothing => true, :status => 200
    else method_name == 'app.uninstall'
      event = Event.find_by(user_id: user_id)
      event.destroy
      render :nothing => true, :status => 200
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
    # render :nothing => true, :status => 200
  end

  private
  def send_message(user_id,text)
    @base_url = 'https://api.flock.co/v1'
    @method = '/chat.sendMessage'
    toWho = 'g:106443_lobby'
    p '*' * 10
    p event = Event.find_by(user_id: user_id)
    p token = event.token
    p get_user_info(user_id, token)
    url = @base_url + @method
    p response = HTTParty.post(url, query:{
      'to' => toWho,
      'token' => token,
      'flockml' => style_important(text)
      })
  end

  def style_important(text)
    styled_text = "<b stle='clor: red;' > #{text} </b>"
  end

end