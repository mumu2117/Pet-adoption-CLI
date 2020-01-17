class Scraper

   

    def self.scraping_buddies(buddies) #scrapes main adoption page: "adopt-oursanctuary"page for the list of all animals.

      buds= []

      doc = Nokogiri::HTML(open("http://bestfriends.org/adopt/adopt-our-sanctuary/#{buddies}"))

      doc.css("div.rg-animal").each do |budster|

        bud_features= {}

        bud_features[:species] = buddies

        bud_features[:name] = budster.css("span.animalName").text
        bud_features[:breed] =budster.css("span.animalBreed").text
        bud_features[:age] = budster.css("span.animalAge").text
        bud_features[:url] = budster.css("a").attribute("href").value

        buds<< bud_features

      end
      
      buds

    end
  
    def self.scrape_buddy_details(url) #scrapes this page once you pick the species of animal, it will show the profile of that particular pet which will help with creating the objects for that particular pet.
      

      buddy_profile_details = {}
      
  
      bud_profile = "http://bestfriends.org" + url
      doc = Nokogiri::HTML(open(bud_profile))
  
      bud_items = doc.css("div.rescue-groups-pet-info-item")
  
      bud_items.each do |attribute|

        if attribute.css("span.gray").text == "Size:"
        buddy_profile_details[:size] = attribute.css("span.bold.black").text

        elsif attribute.css("span.gray").text == "Color:"
          buddy_profile_details[:color] = attribute.css("span.bold.black").text

        elsif attribute.css("span.gray").text == "Sex:"
          buddy_profile_details[:sex] = attribute.css("span.bold.black").text

        end

      end

      buddy_profile_details[:description] = doc.css("section.rescue-groups-pet-info-section p").text.gsub("\n                        ", "")
      buddy_profile_details

    end

  end
  