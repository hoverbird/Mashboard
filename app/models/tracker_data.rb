module Mashboard
  class TrackerData

    PROJECT_ATTRIBUTES = %w(current_velocity name week_start_day)
    STORY_ATTRIBUTES = %w(current_state description jira_id jira_url name owned_by requested_by story_type url estimate)    
    
    def config
      Mashboard.config.tracker
    end

    def initialize
      PivotalTracker::Client.use_ssl = true
      if config.token && !config.token == ''
        PivotalTracker::Client.token = config.token
      else
        PivotalTracker::Client.token(config.username, config.password)
      end

      @project = PivotalTracker::Project.find(config.project_id)
      raise "No project found with ID #{config.project_id}" unless @project
      @iteration = PivotalTracker::Iteration.current(@project)
    end
    
    def hashify(obj, attrs)
      hsh = {}
      attrs.each do |attr|
        hsh[attr] = obj.send(attr)
      end
      hsh
    end
    
    def stories
      @iteration.stories.map {|story| hashify(story, STORY_ATTRIBUTES) }
    end
    
    def project
      hashify(@project, PROJECT_ATTRIBUTES)
    end
  end
end
