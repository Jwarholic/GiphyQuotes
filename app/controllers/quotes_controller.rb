post '/quotes/new' do
  @word = params[:word]
  @quote = Quote.quote(@word)
  @giphy = Giphy.add_giphy(@word)

  @quote = JSON.parse(@quote.body)
  @quote = @quote["contents"]["quote"]

  if request.xhr?
    erb :'quotes/_new', layout: false, locals: {giphy: @giphy, quote: @quote}
  else
    erb :'quotes/new'
  end
end
