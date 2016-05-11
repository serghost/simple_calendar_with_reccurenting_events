class Repeat < ActiveRecord::Base
  include EventMixin
  belongs_to :event

  scope :root_event, -> (id) { where(:event_id => id) }

end
