require "open-uri"
require "nokogiri"
USER_AGENT = "Mozilla/5.0 (Windows NT x.y; rv:10.0) Gecko/20100101 Firefox/10.0"



class Scraper
attr_reader :titles, :descriptions, :ratings, :urls, :prep_times

  def scrape(keyword)
    url = "https://www.allrecipes.com/search/results/?search=#{keyword}"
    html_content = URI.open(url, "User-Agent" => USER_AGENT).read
    doc = Nokogiri::HTML(URI.open(url, "User-Agent" => USER_AGENT).read)
    @titles = doc.search("h3.card__title").text.strip.split("\n").map { |string| string.strip }.reject{ |string| string==""}.first(5)
    @descriptions = doc.search(".card__summary").text.strip.split("\n").map { |string| string.strip }.reject{ |string| string==""}.first(5)
    @ratings = doc.search(".review-star-text").text.strip.split(":").drop(1).map { |string| string.strip }.map { |string| string.gsub(" starsRating","/5") }.reject{ |string| string==""}.first(5)
    @urls = []
    doc.search(".card__detailsContainer-left .card__titleLink").each do |url|
      @urls.append(url.attribute("href").value)
    end
    @urls= @urls.first(5)
    @prep_times = []
    @urls.each { |url| @prep_times.append(self.scrape_time(url)) }
  end

  def scrape_time(url)
    html_content = URI.open(url, "User-Agent" => USER_AGENT).read
    doc = Nokogiri::HTML(URI.open(url, "User-Agent" => USER_AGENT).read)
    prep_time = doc.search(".recipe-meta-item-body").text.strip.split(" ").first(1)[0]
  end

end




# scrap = Scraper.new
# scrap.scrape("https://www.allrecipes.com/search/results/?search=chocolate")
# # p scrap.titles.
# p scrap.scrape_time(scrap.urls[0])
# p scrap.prep_times
