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
     
    if_none
     
    self

  end
  
  def if_none                                      
     attributes = ["species", "name", "breed", "age", "url", "size", "color", "sex", "description"]                  
     zero = [" ", "", nil]                      
    attributes.each do |zumba| 
       if zero.any? {|z| self.send("#{zumba}") == z}     

        self.send(("#{zumba}="), "N/A")      
  
  
       end  


    end  

 end



end


