class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  USER_ROLES = %w(patron owner)
  private_constant :USER_ROLES


  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  validates_inclusion_of :role, in: USER_ROLES
  validates_presence_of :role

  has_many :restaurants, foreign_key: :owner_id
  has_many :stars
  has_many :starred_restaurants, through: :stars, source: :restaurant

  def owner?
      role == "owner"
  end

  def has_starred?(restaurant)
      starred_restaurants.include?(restaurant)
  end


end
