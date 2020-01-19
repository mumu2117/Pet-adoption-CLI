class BuddyCount

  def initialize(tribe, member)

    if tribe == "Small"

      @tribe = "small-furry"

    else

      @tribe = tribe.downcase

    end

    @tribe_member= member

    tribe_create

  end

  def tribe_create

   tribe_hash = Scraper.scraping_buddies(@tribe)

    @tribe_member.create_new(tribe_hash)

  end

  def self.additonal_features_of_buds(number,tribe_member)
    buddy = tribe_member.all[number]
    attributes = Scraper.scrape_buddy_details(buddy.url)
    buddy.add_attributes(attributes)
  end

end
