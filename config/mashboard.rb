module Mashboard
  $LOAD_PATH <<  File.expand_path(File.dirname(__FILE__))
  $LOAD_PATH <<  File.expand_path(File.join(File.dirname(__FILE__), '../app'))
  
  EXTERNAL_LIBS = ['rubygems', 'bundler/setup', 'gmail', 'json', 'pivotal-tracker']
  LIB_FILES = ['config', 'models/gmail_data', 'models/tracker_data']
  
  (EXTERNAL_LIBS + LIB_FILES).each {|lib| require lib}  
  
  def self.config
    @@config ||= Config.new
  end

end
