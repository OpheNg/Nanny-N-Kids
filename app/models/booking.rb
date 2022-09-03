class Booking < ApplicationRecord
  belongs_to :user
  belongs_to :nanny  


  validate :after_today
  validate :after_start_date

  def after_today
    unless start_date > Date.today
      errors.add(:start_date, "should be after today")
    end
  end

  def after_start_date
    unless end_date >= start_date
      errors.add(:end_date, "must be the same or after your start day")
    end
  end 
  
end
