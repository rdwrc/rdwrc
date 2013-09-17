class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :timeoutable

  attr_accessible :name, :email, :password, :password_confirmation, :remember_me
  attr_accessible :admin, :editor, :author, :contributor

  has_many :articles

  acts_as_tagger

  def admin?
    admin
  end

  def editor?
    editor
  end

  def author?
    author
  end

  def contributor?
    contributor
  end
end
