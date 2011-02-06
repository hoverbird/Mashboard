$LOAD_PATH <<  File.expand_path(File.dirname(__FILE__))

module Mashboard
  EXTERNAL_LIBS = ['rubygems', 'bundler/setup', 'gmail', 'pivotal-tracker']
  LIB_FILES = ['config', 'gmail_data', 'pivotal_tracker_data']
  
  (EXTERNAL_LIBS + LIB_FILES).each {|lib| require lib}
  
  
  def self.config
    @@config ||= Config.new
  end
  
  GmailData.fetch
end
