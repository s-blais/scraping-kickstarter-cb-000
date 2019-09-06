require 'nokogiri'
require 'pry'

def create_project_hash
  html = File.read('fixtures/kickstarter.html')
  kickstarter = Nokogiri::HTML(html)
  projects = {}

  kickstarter.css(".project-card")each do |project|
    title = project.css("h2.bbcard_name strong a").text
    projects[title.to_sym] = {
      :image_link => project.css("div.project-thumbnail a img").attribute("src").value
      :description => project.css("p.bbcard_blurb").text.strip
      :location => project.css(".location-name").text
      :percent_funded => project.css(".project-stats li.first.funded strong").text.gsub("%", "").to_i
    }  
  end

  projects

end


  # projects: kickstarter.css(".project-card")
  # title: project.css("h2.bbcard_name strong a").text
  # image link: project.css("div.project-thumbnail a img").attribute("src").value
  # desc: project.css("p.bbcard_blurb").text.strip
  # project.css(".location-name").text
  # % funded project.css(".project-stats li.first.funded strong").text.gsub("%", "").to_i


create_project_hash
