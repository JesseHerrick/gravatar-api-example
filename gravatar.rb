require 'sinatra'
require 'digest/md5'
require 'json'
require 'gravatar-api'

get '/' do
	erb :index
end

get '/:email' do
	@email = params[:email]
	profile = Gravatar.new(@email)
	@url = profile.url

	erb :gravatar
end

get '/:email/:size' do 
	@profile = Gravatar.new(params[:email])
	@url = @profile.url(:size => params[:size])

	erb :gravatar
end