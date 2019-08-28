require 'open-uri'
require 'net/http'
require 'uri'

class SitesStatusCheckService
    def self.check
      Project.all.each do |project|
        project.sites.each do |site|
          begin
            uri = URI.parse(site.link)  
            site_res = open(uri)
            if site_res.status.first.eql?('200')
              puts "here in update"  
              site.update_attributes(status: site_res.status.first, last_checked: Time.now)
            end
          rescue => e
            puts e
            case e         
            when Net::OpenTimeout
              puts "Something is wrong with #{site.title}"
              ErrorMailer.with(user: site.user, data: site).report.deliver
            when OpenURI::HTTPError
              puts "Something is wrong with #{site.title}"
              ErrorMailer.with(user: site.user, data: site).report.deliver  
            else
              puts "Something is wrong with #{site.title}"
              ErrorMailer.with(user: site.user, data: site).report.deliver 
            end   
          end
      end 
    end
  end
end