module Mashboard
  class GmailData
    attr_reader :as_hash
    
    def config
      Mashboard.config.gmail
    end
    
    def initialize
      @as_hash = {}
      
      Gmail.new(config.username, config.password) do |gmail|
        @as_hash[:total]  = gmail.inbox.count
        @as_hash[:unread] = gmail.inbox.count(:unread)
        @as_hash[:read]   = gmail.inbox.count(:read)
      end
      @as_hash
    end
    
  end
end
