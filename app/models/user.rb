class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :confirmable, :lockable,
         :trackable

  has_many :days

  def self.find_or_create_day
    the_day = Day.where(created_at: Time.zone.now.beginning_of_day..Time.zone.now.end_of_day).first
    return the_day if the_day

    the_day = Day.new
    return the_day if the_day.save
  end
end
