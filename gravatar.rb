require 'sinatra'
require 'digest/md5'
require 'json'
require 'gravatar-api'

helpers do
	def hash!(string)
		Digest::MD5.hexdigest(string)
	end
end

get '/' do
	erb :index
end

get '/:email' do
	@email = params[:email]
	profile = Gravatar.new(@email)
	@url = profile.url

	erb :index
end

get '/:email/:size' do 
	@profile = Gravatar.new(params[:email])
	@url = @profile.url(:size => params[:size])

	erb :index
end