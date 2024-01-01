class Assessment < ApplicationRecord
  belongs_to :user
  has_and_belongs_to_many :questions
  has_many :performances
  enum title: {c: 0, cpp: 1, java: 2, pyhton: 3, ruby: 4, ds: 5}
  enum level: {low: 0, medium: 1, high: 2}


  validates :title, presence: true

  

  def self.check_date(n)
    where("created_at >= ?", n.days.ago)
  end
end
