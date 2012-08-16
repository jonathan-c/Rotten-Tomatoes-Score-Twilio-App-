module SendTextHelper
  
  def find_movie_score(movie)
   bf = BadFruit.new("BF API KEY GOES HERE") 
 	 movies = bf.movies.search_by_name(movie) 
 	 cast = movies[0].full_cast 
 	 reviews = movies[0].reviews
 	 scores = movies[0].scores 

 	 scores.critics_score.to_s + "%"
   #cast.methods.sort
  end
   
end
