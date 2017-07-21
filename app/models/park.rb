class Park < ApplicationRecord

  belongs_to :state

  validates :name, presence: true
  validates :description, presence: true

  scope :search, -> (name) { where("name like ?", "%#{name}%")}

  scope :getNational, -> (val) { where(national_park: val) }

end
