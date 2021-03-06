class Day < ApplicationRecord
  belongs_to :user, optional: true
  has_many :entries

  scope :not_empty, -> {
    left_outer_joins(:entries)
    .where(entries: {archived_at: nil})
    .where.not(entries: {id: nil}).uniq
  }

  scope :not_archived_empty, -> {
    left_outer_joins(:entries)
    .where.not(entries: {id: nil, archived_at: nil}).uniq
  }

  before_create do
    self.title = datetime.strftime("%d/%m/%Y")
  end

  def self.find_or_create(time)
    day = Day.where(created_at: time.beginning_of_day..time.end_of_day).first
    day ||= Day.create({datetime: time.beginning_of_day})
    return day
  end
end
