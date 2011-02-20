module Mashboard
  ['config/mashboard', 'erb', 'sinatra'].each {|lib| require lib}
  
  set :root, File.expand_path(File.dirname(__FILE__)) + '/app'
  set :public, Proc.new { File.join(root, "javascripts") }
  set :views, Proc.new { File.join(root, "views") }
  
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
