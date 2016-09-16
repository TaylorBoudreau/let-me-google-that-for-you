# -*- ruby -*-
#encoding: utf-8

require 'sinatra'
require 'uri'

BASE_URL = 'http://lmgtfy.com/?q='

def authenticated_with_token!
	halt( 401, 'Unathenticated!' ) unless ENV['whitelisted_token'] == params['token']
end

get '/' do
	raise 'Hit "/search" to get your lmgtfy url'
end

get '/search/' do
	authenticated_with_token!
	search_text = URI.escape( params['text'] )
	url = BASE_URL + "#{search_text}"
	return url
end

