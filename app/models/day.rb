class Day < ApplicationRecord
  belongs_to :user, optional: true
  attr_accessor :chosen_time
  has_many :entries

  before_create do
    self.title = chosen_time.strftime("%d/%m/%Y")
  end

  def self.find_or_create(time)
    day = Day.where(created_at: time.beginning_of_day..time.end_of_day).first
    day ||= Day.create({chosen_time: time})
    return day
  end
end
