class Tag < ActiveRecord::Base
    
  #A tag has many events and has many shows through characters
  
  belongs_to :container
  has_many :events

  def self.tag_count
    Tag.count
  end

  def self.last_tag
      Tag.last
  end

  def self.find_tag_by_type(type)
    Tag.find_by(type)
  end

  def change_container_id(id)
    self.update.container_id = id
  end


end