require 'twilio-ruby'

class ReceiveTextController < ApplicationController
  def create
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file

    #   SMSLogger.log_text_message from_number, message_body
    # message_body = params["Body"]
    # from_number = params["From"]

    # # put your own credentials here
    # account_sid = 'APba5bd1286806414f9dc8ca3ae05ab624'
    # auth_token = '9be6999dcd821ee41a5c1eff4a8296f6'
    # 
    # # set up a client to talk to the Twilio REST API
    # @client = Twilio::REST::Client.new account_sid, auth_token
    
    @post=Post.create!(body: params[:Body], from: params[:From])
    @params = Post.create!(body: params.inspect, from: "Dumping Params")
    
    # @parameters = @client.account.sms.messages.create(body: params[:Body], from: params[:From])
    # @post = Post.create!(@parameters)
  end
end
