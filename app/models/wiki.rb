class Wiki < ActiveRecord::Base
  belongs_to :user
  has_many :users, through: :collaborators
  has_many :collaborators

  validates :title, presence: true

  def private_wiki?
    is_private == true
  end

  def public_wiki?
    is_private == false
  end
end
