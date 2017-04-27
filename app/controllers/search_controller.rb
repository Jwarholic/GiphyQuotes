post '/searches/new' do

  #The word inputted into the search from the home page
  @word = params[:search][:word]


  #Running through the quote Module to retrieve a quote.
  @quote = Quote.quote(@word)

  #Pulls the GIPHY image URL through giphy API method
  @giphy = Giphy.add_giphy(@word)

  #Returns a JSON format through the quotes API
  @quote = JSON.parse(@quote.body)

  #Returns the quote through the JSON API
  @quote = @quote["contents"]["quote"]


  #If a user is logged in it will save the search into the database for later use
  if current_user
    @search = Search.new(user_id: current_user.id,
                         word: @word,
                         giphy: @giphy,
                         quote: @quote)

  end


  #Checks to see if the form was submitted through AJAX.
if request.xhr?
  if @search && @search.save
    @update = "Successfully added to history."
    erb :'searches/_new', layout: false
  else
    erb :'searches/_new', layout: false
  end
  else
    #WOULD REDIRECT TO A SHOW GIPHY PAGE too lazy to make right now.
    # redirect '/search/show'
end
end


#Form Through the Users PROFILE page
#Will find the search and return the giphy and quote back to the page
#sends back a partial to the page

get '/searches/:id' do
  @search = Search.find(params[:id])
  @giphy = @search.giphy
  @quote = @search.quote

  if request.xhr?
    erb :'/searches/_show', layout: false
  else
    #redirect to individual search page
    redirect "/searches/#{@search.id}"
  end
end
