class Entry < ApplicationRecord
  attr_accessor :user

  before_create do
    self.datetime ||= DateTime.now
  end

  after_create do
    if user
      day = user.find_or_create_day
      day << self
      day.save
    end
  end
end
