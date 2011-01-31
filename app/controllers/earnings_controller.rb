class EarningsController < ApplicationController
  require 'open-uri'
  require 'nokogiri'

  def index
    doc = Nokogiri::HTML(open("http://cli.linksynergy.com/cli/publisher/reports/downloadReport.php?bdate=20110101&edate=20110131&cuserid=shashank123&cpi=isiritech99&eid=vXQMo6zjz3Y"))
    puts doc
    doc.css('p').each do |link|
      puts link.content
    end

  end

end

