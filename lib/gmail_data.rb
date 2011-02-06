module Mashboard
  module GmailData
    
    def self.config
      Mashboard.config['gmail']
    end
    
    def self.fetch
      Gmail.new config['username'], config['password'] do |gmail|
        puts "Auth'd yr gmails!"
        puts "Total:  #{ gmail.inbox.count }"
        puts "Unread: #{ gmail.inbox.count :unread}"
        puts "Read:   #{ gmail.inbox.count :read }"
      end
    end
    
  end
end
