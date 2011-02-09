module Mashboard
  ['lib/mashboard', 'erb', 'sinatra'].each {|lib| require lib}
  
  get '/' do
    erb :index
  end
  
  get '/gmail' do
    callback = params.delete('callback') # jsonp
    json = GmailData.new.as_hash.to_json

    if callback
      content_type :js
      response = "#{callback}(#{json})" 
    else
      content_type :json
      response = json
    end
    response
  end
    
end
