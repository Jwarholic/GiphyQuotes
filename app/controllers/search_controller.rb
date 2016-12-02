post '/searches/new' do

  @word = params[:search][:word]
  @quote = Quote.quote(@word)
  @giphy = Giphy.add_giphy(@word)

  @quote = JSON.parse(@quote.body)
  @quote = @quote["contents"]["quote"]

  if current_user
    @search = Search.new(user_id: current_user.id,
                         word: @word,
                         giphy: @giphy,
                         quote: @quote)
  end

if request.xhr?
  if @search && @search.save
    @update = "Successfully added to history."
    erb :'searches/_new', layout: false, locals: {giphy: @giphy, quote: @quote, category: @word, update: @update}
  else
    erb :'searches/_new', layout: false, locals: {giphy: @giphy, quote: @quote, category: @word}
  end
  else
    #WOULD REDIRECT TO A SHOW GIPHY PAGE too lazy to make right now.
    # redirect '/search/show'
end
end


get '/searches/:id' do
  @search = Search.find(params[:id])
  @giphy = @search.giphy
  @quote = @search.quote

  if request.xhr?
    erb :'/searches/_show', layout: false, locals: {giphy: @giphy, quote: @quote}
  else
    #redirect to individual search page
    redirect "/searches/#{@search.id}"
  end
end
