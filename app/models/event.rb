class Event < ActiveRecord::Base
  include EventMixin

  belongs_to :user
  has_many :repeats, dependent: :destroy
  accepts_nested_attributes_for :repeats

  # after_touch :remove_replicas
  after_save :replicate

  REPEAT = ["none", "daily", "weekly", "monthly", "yearly"]
  COLOR_TAG = ["primary", "red", "blue", "yellow", "green"]



  def replicate
    case self.repeat
    when "daily"
      # TODO: add :until field to the form
      all_dates = Recurrence.new(:starts => self.date,
                                 :every => :day,
                                 :until => '2017-12-31')
    when "weekly"
      all_dates = Recurrence.new(:starts => self.date,
                                 :every => :week,
                                 :on => Date.today.wday,
                                 :until => '2017-12-31')
    when "monthly"
      all_dates = Recurrence.new(:starts => self.date,
                                 :every => :month,
                                 :on => Date.today.mday,
                                 :until => '2017-12-31')
    when "yearly"
      all_dates = Recurrence.new(:starts => self.date,
                                 :every => :year,
                                 :on => Date.today.yday,
                                 :until => '2017-12-31')
    else
      all_dates = [Date.today]
    end

    all_dates.each do |date|
      event = Repeat.new(date: date,
                         event_id: self.id,
                         title: self.title,
                         tag: self.tag)
      event.save
    end
  end

end
