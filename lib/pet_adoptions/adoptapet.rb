class Buddies

  attr_accessor :species, :name, :breed, :size, :age, :url,  :color, :sex, :description

  def initialize(attributes)
    attributes.each {|k, v| self.send(("#{k}="), v)}
    self.class.all << self unless self.class.all.any? {|pet| pet.url == self.url}
  end

  def self.create_new(buddy_list)

    buddy_list.each do |bud_bud|
      self.new(bud_bud)
    end

  end

  def add_attributes(buddy_pack)

   buddy_pack.each do |k, v|
      self.send(("#{k}="), v)
    end
      
    self

  end
  




end
 

  class Cats < Buddies
    @@all = []
  
    def self.all
      @@all
    end
  
  end

  class Dogs < Buddies
    @@all = []
  
    def self.all
      @@all
    end
  
  end

  class Birds < Buddies
  @@all = []

  def self.all
    @@all
  end

end

class Equine < Buddies
  @@all = []

  def self.all
    @@all
  end

end

class Barnyard < Buddies
  @@all = []

  def self.all
    @@all
  end

end

class Pigs < Buddies
  @@all = []

  def self.all
    @@all
  end

end

class Rabbits < Buddies
  @@all = []

  def self.all
    @@all
  end

end

class Small < Buddies

  @@all = []

  def self.all
    @@all
  end

end

  

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


