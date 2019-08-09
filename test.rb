require 'nokogiri'
require 'open-uri'
require 'pry'


def movie_ranker_scraper
  html = File.read('https://www.ranker.com/crowdranked-list/the-best-movies-of-all-time')
  ranker = Nokogiri::HTML(html)
  
  movies = {}
  
    ranker.css("listItem.listItem__h2.listItem__h2--grid-nvscdSdow__r2--zyzEz.pointer.listItem__h2--buyButton.flex.relative.robotoC").each do |project|
 title = project.css("div.listItem__data span.listItem__info.block a").text
    projects[title] = {
      rank:           project.css("ul.project-meta span.location-name").text,
      image_link:     project.css("figure.listItem__figure.relative a img").attribute("src").value,
      description: 	  project.css("div.listItem__data span.listItem__props.block div.listItem__blather.grey.default span").text,
      actors:         project.css("div.listItem__data span.listItem__props.block span").text
    }
  binding.pry
  end 
  binding.pry
  movies

end