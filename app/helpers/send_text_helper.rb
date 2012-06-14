module SendTextHelper
  
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
