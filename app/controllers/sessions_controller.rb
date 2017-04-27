#Form page to login user
get '/sessions/new' do
	erb :'sessions/new'
end

#Logs in the user if the password matches
post '/sessions' do
	@user = User.authenticate(params[:user])
	if @user
		session[:id] = @user.id
		redirect '/'
	else
		@error = "Email and password not a valid combination."
		erb :'sessions/new'
	end
end

#logs out the user
delete '/sessions' do
	session[:id] = nil
	redirect '/'
end