class ReceiveTextController < ApplicationController
  def index
    # let's pretend that we've mapped this action to 
    # http://localhost:3000/sms in the routes.rb file

    # message_body = params["Body"]
    #   from_number = params["From"]
    # 
    #   SMSLogger.log_text_message from_number, message_body
    @post=Post.new(body: params[:Body], from: params[:From])
    @post.save
    @params = Post.create!(body: params.inspect, from: "Dumping Params")
  end
end
