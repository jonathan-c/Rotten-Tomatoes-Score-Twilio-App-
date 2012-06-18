module ReceiveTextHelper
  
  def send_text_message
   @account_sid = 'AC8d291a7930f04a79ab486f95c8058a18'
   @auth_token = '9be6999dcd821ee41a5c1eff4a8296f6'

   # set up a client to talk to the Twilio REST API
   @client = Twilio::REST::Client.new(@account_sid, @auth_token)

   # Uncomment when testing on the local database
   # @example = Post.create(body: "american pie", from: "+15166582879")
   
   @request = Post.last.body.titleize
   @send_message_to = Post.last.from
   @account = @client.account
   movie_score = find_movie_score(@request)
   @message = @account.sms.messages.create({:from => '+15163368089', :to => @send_message_to, :body => "The Rotten Tomatoes score for " + '"' + @request + '"' + " is " + movie_score })
   puts @message
   end
   
   def find_movie_score(movie)
    bf = BadFruit.new("c337mtn76ujsn6m6krkyrdp2") 
  	 movies = bf.movies.search_by_name(movie) 
  	 cast = movies[0].full_cast 
  	 reviews = movies[0].reviews
  	 scores = movies[0].scores 

  	 scores.critics_score.to_s + "%"
  	 #movies 
    #cast.methods.sort
   end
end
