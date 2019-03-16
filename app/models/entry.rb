class Entry < ApplicationRecord
  belongs_to :day, optional: true
  attr_accessor :user
  validates :text, presence: true

  before_create do
    self.datetime ||= DateTime.now
    day = Day.find_or_create(self.datetime)
    self.day_id = day.id
  end

  before_update do
    if self.datetime_changed?
      day = Day.find_or_create(self.datetime)
      self.day_id = day.id
    end
  end
end
