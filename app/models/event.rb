class Event < ActiveRecord::Base
    
    #An event belongs to a tag and a container
    belongs_to :tag
    belongs_to :container
    
      def self.event_count
        Event.count
      end
    
      def self.last_event
          Event.last
      end
    
      def self.find_event_by_name(name)
        Event.find_by(name)
      end

      def self.find_event_by_type(type)
        Event.find_by(type)
      end

      def self.find_event_by_tag_id(tagId)
        Event.find_by(self.tag_id.tagId)
      end

      def self.find_event_by_container_id(id)
        Event.find_by(self.container_id.id)
      end

      def update_event_name(name)
        self.update(name)
      end



end