class User < ActiveRecord::Base

  has_many :wikis, through: :collaborators
  has_many :collaborators
  has_many :wikis

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  after_initialize :default_role

  def standard?
    role == 'standard'
  end

  def premium?
    role == 'premium'
  end

  def admin?
    role == 'admin'
  end


  private

  def default_role
    self.role ||= 'standard'
  end

  


  
end
