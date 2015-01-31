class Wiki < ActiveRecord::Base
  belongs_to :user
  validates :title, presence: true

  def private_wiki?
    is_private == true
  end

  def public_wiki?
    is_private == false
  end
end
