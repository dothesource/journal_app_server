class Entry < ApplicationRecord
  belongs_to :day, optional: true
  attr_accessor :user
  validates :text, presence: true

  before_create do
    self.datetime ||= DateTime.now
  end

  after_create do
    time = self.datetime || Time.zone.now
    the_day = Day.where(created_at: time.beginning_of_day..time.end_of_day).first
    if the_day
      the_day.entries << self
      the_day.save
    else
      the_day = Day.new
      the_day.entries << self
      the_day.save!
    end

    # day = User.find_or_create_day

    # the_day.save
  end
end
