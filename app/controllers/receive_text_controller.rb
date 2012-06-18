include ReceiveTextHelper
 
class ReceiveTextController < ApplicationController

  def create
    @post=Post.create!(body: params[:Body], from: params[:From])
    send_text_message
  end
end
