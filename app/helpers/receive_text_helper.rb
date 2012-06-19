module ReceiveTextHelper
  
  def send_text_message
   @account_sid = 'AC8d291a7930f04a79ab486f95c8058a18'
   @auth_token = '9be6999dcd821ee41a5c1eff4a8296f6'

   # set up a client to talk to the Twilio REST API
   @client = Twilio::REST::Client.new(@account_sid, @auth_token)

   # Uncomment when testing on the local database
   # @example = Post.create(body: "american pie", from: "+15166582879")
   
   @request = Post.last.body
   @send_message_to = Post.last.from
   @account = @client.account
   movie_score = find_movie_score(@request)
   if return_movie_name(@request) == nil
     @message = @account.sms.messages.create({:from => '+15163368089', :to => @send_message_to, :body => "Did you type in the name of the movie correctly? Double check. It's also possible that RT does not have this movie in its records." })
      puts @message
   elsif movie_score == 1%
     @message = @account.sms.messages.create({:from => '+15163368089', :to => @send_message_to, :body => "There is no Rotten Tomatoes critic score for this movie yet."  })
      puts @message
   else
     @message = @account.sms.messages.create({:from => '+15163368089', :to => @send_message_to, :body => "The Rotten Tomatoes score for "             + '"' + @returned_movie + '"' + " is " + movie_score + "%" })
     puts @message
   end
   end
   
   def find_movie_score(movie)
    bf = BadFruit.new("c337mtn76ujsn6m6krkyrdp2") 
  	 movies = bf.movies.search_by_name(movie) 
  	 @returned_movie = movies[0].name
  	 cast = movies[0].full_cast 
  	 reviews = movies[0].reviews
  	 scores = movies[0].scores 

  	 scores.critics_score
  	 #movies 
    #cast.methods.sort
   end
   
   def return_movie_name(movie)
     bf = BadFruit.new("c337mtn76ujsn6m6krkyrdp2") 
   	 movies = bf.movies.search_by_name(movie) 
   	 @returned_movie_name = movies[0].name
   	 @returned_movie_name
    end
   
   def return_movie_thumbnail(movie)
     bf = BadFruit.new("c337mtn76ujsn6m6krkyrdp2") 
     @returned_movie = bf.movies.search_by_name(movie)
     image_tag(@returned_movie[0].posters.thumbnail)
   end
end
