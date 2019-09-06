require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  binding.pry

  # projects: kickstarter.css(".project-card")
  # title: project.css("h2.bbcard_name strong a").text
end

create_project_hash
