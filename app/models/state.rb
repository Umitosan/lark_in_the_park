class State < ApplicationRecord

  has_many :parks

  validates :name, presence: true

  scope :search, -> (name) { where("name like ?", "%#{name}%")}

end
