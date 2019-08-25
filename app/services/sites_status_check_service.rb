require 'open-uri'
require 'net/http'
require 'uri'

class SitesStatusCheckService
    def self.check
      Project.all.each do |project|
        project.sites.each do |site|
          uri = URI.parse(site.link)  
          site_res = open(uri)
          puts site_res.status.first
          site.update_attributes(status: site_res.status.first, last_checked: Time.now)       
          unless site_res.status.first.eql?('400')
            puts "Something is wrong with #{site.title}"
            ErrorMailer.with(user: site.user, data: site).report.deliver
          end
        end
      end 
    end
end