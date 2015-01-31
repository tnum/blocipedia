class Wiki < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true

  #scope :visible_to, -> { where(is_private: nil) }
end
