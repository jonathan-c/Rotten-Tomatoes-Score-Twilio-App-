class SendTextController < ApplicationController
  include SendTextHelper
  
  def index
  end
  
  def send_text_message
   @account_sid = 'AC8d291a7930f04a79ab486f95c8058a18'
   @auth_token = '9be6999dcd821ee41a5c1eff4a8296f6'

   # set up a client to talk to the Twilio REST API
   @client = Twilio::REST::Client.new(@account_sid, @auth_token)

   @movie = "Prometheus"
   @account = @client.account
   movie_score = find_movie_score(@movie)
   @message = @account.sms.messages.create({:from => '+14155992671', :to => '+15166582879', :body => movie_score })
   puts @message
   end
end
