module ReceiveTextHelper
  
  def send_text_message
   @account_sid = 'XXXXXXXXXX'
   @auth_token = 'XXXXXXXXX'
   @sandbox_number = '+1XXXXXXX'
   @from_number = '+1XXXXXXX'

   # set up a client to talk to the Twilio REST API
   @client = Twilio::REST::Client.new(@account_sid, @auth_token)

   # Uncomment when testing on the local database
   # @example = Post.create(body: "Fight Club", from: "+1XXXXXXX")
   
   @request = Post.last.body
   @send_message_to = Post.last.from
   @account = @client.account
   movie_score = find_movie_score(@request)
   if movie_score == "-1"
     @error_message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "There is no Rotten Tomatoes critic score for this movie yet."  })
      puts @error_message
   else
     @message = @account.sms.messages.create({:from => @from_number, :to => @send_message_to, :body => "The Rotten Tomatoes score for "             + '"' + @returned_movie + '"' + " is " + movie_score + "%" })
     puts @message
   end
   end
   
   def find_movie_score(movie)
    bf = BadFruit.new("BF API KEY GOES HERE") 
  	 movies = bf.movies.search_by_name(movie) 
  	 @returned_movie = movies[0].name
  	 cast = movies[0].full_cast 
  	 reviews = movies[0].reviews
  	 scores = movies[0].scores 

  	 scores.critics_score.to_s
    #cast.methods.sort
   end
   
   def return_movie_thumbnail(movie)
     bf = BadFruit.new("BF API KEY GOES HERE") 
     @returned_movie = bf.movies.search_by_name(movie)
     image_tag(@returned_movie[0].posters.thumbnail)
   end
end
