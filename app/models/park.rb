class Park < ApplicationRecord

  belongs_to :state

  validates :description, presence: true

end
