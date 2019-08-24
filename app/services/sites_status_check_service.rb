require 'nokogiri'

class SitesStatusCheckService

    def initialize(sites)
      @sites = sites
    end

    def site_status_check
      @sites.each do |site|
        site.url #status check
      end  
    end
end