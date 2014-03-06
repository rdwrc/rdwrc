class User < ActiveRecord::Base
  devise *[
    :confirmable,
    :database_authenticatable,
    :lockable,
    :recoverable,
    :registerable,
    :rememberable,
    :timeoutable,
    :validatable
  ]

  has_many :user_roles, dependent: :destroy
  has_many :roles, through: :user_roles
  accepts_nested_attributes_for :user_roles, allow_destroy: true

  has_many :articles

  validates :email, uniqueness: true, unless: 'email.blank?'

  acts_as_tagger

  before_save do
    set_role
  end

  %w(admin editor author contributor guest).each do |role_code|
    define_method "#{role_code}?" do
      roles.any? { |role| role.code.to_s == role_code.to_s }
    end
  end

  # order is from most to least privileged
  def primary_role
    return :admin if admin?
    return :editor if editor?
    return :author if author?
    return :contributor if contributor?
    return :guest
  end

  def primary_role?
    roles.include? primary_role
  end

  private
  def set_role
    self.roles << Role.find_or_create_by(code: :email, name: primary_role) unless primary_role?
  end
end
