class CheckSiteStatusJob < ApplicationJob
  require 'active_support/duration'
  queue_as :default
  
  after_perform :run_again

  def perform(*args)
    SitesStatusCheckService.check
  end

  def run_again
    self.class.set(wait: 1.hour).perform_later
  end

end
