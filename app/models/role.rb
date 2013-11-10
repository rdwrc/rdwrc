class Role < ActiveRecord::Base
  has_many :user_roles, dependent: :destroy
  has_many :users, through: :user_roles

  validates :code, presence: true, uniqueness: true, format: /[a-z]+[a-z0-9_]*/
  validates :name, presence: true, uniqueness: true
end
