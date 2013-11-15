require 'sinatra'
require 'digest/md5'
require 'json'

helpers do
	def hash!(string)
		Digest::MD5.hexdigest(string)
	end
end

get '/' do
	erb :index
end

get '/:email' do
	@email = params[:email].downcase
	@hash = hash!(@email)
	
	@url = "http://www.gravatar.com/avatar/#{@hash}"
	
	erb :index
end

get '/:email/:size' do
	@email = params[:email].downcase
	@hash = hash!(@email)

	@size = params[:size]

	@url = "http://www.gravatar.com/avatar/#{@hash}?s=#{@size}"	

	erb :index
end