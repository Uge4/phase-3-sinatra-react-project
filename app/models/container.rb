class Container < ActiveRecord::Base
    
  #A container has many tags and has many triggers through tags
  
  has_many :tags
  has_many :events, through: :tags

  attr_accessor :domain_name

  def self.get_all_containers
    Containers.all
  end

  def create_domain_url
    '#{name}.#{domain_name}'
  end


end