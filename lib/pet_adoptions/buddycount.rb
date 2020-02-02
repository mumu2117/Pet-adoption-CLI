class BuddyCount

  def initialize(pack,member)

    if pack == "Small"

      @pack = "small-furry"

    else

      @pack = pack.downcase

    end

    @pack_member= member

    pack_create

  end

  def pack_create

   pack_hash = Scraper.scraping_buddies(@pack)

    @pack_member.create_new(pack_hash)

  end

  def self.additonal_features_of_buds(number,pack_member)
    buddy = pack_member.all[number]
    attributes = Scraper.scrape_buddy_details(buddy.url)
    buddy.add_attributes(attributes)
  end

end
