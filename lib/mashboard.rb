module Mashboard
  $LOAD_PATH <<  File.expand_path(File.dirname(__FILE__))
  EXTERNAL_LIBS = ['rubygems', 'bundler/setup', 'gmail', 'json', 'pivotal-tracker']
  LIB_FILES = ['config', 'gmail_data', 'tracker_data']
  
  (EXTERNAL_LIBS + LIB_FILES).each {|lib| require lib}
  
  def self.config
    @@config ||= Config.new
  end

end
