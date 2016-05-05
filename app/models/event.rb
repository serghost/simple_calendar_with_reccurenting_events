class Event < ActiveRecord::Base
  belongs_to :calendar
  belongs_to :user

  REPEAT = ["daily", "weekly", "monthly", "yearly"]
end
