class Event < ActiveRecord::Base
  belongs_to :farm

  def start_date
    DateTime.now
  end
  def starts_at
    DateTime.now
  end
end
