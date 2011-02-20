module Mashboard
  class TrackerData
    attr_reader :project, :iteration
    
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

  end
end
