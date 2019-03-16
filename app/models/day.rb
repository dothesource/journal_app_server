class Day < ApplicationRecord
  belongs_to :user, optional: true
  has_many :entries

  before_create do
    self.title = Time.now.strftime("%d/%m/%Y")
  end
end