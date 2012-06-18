class ReceiveTextController < ApplicationController
  def create
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file

    #   SMSLogger.log_text_message from_number, message_body
    # message_body = params["Body"]
    # from_number = params["From"]
    
    @post=Post.create!(body: params[:Body], from: params[:From])
    @params = Post.create!(body: params.inspect, from: "Dumping Params")
  end
end
