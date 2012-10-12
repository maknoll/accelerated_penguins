class User < ActiveRecord::Base
  has_many :posts, foreign_key: 'author_id'
  before_save :hash_password

  attr_accessor :password

  attr_accessible :about, :email, :name, :password

  validates_presence_of :password, :on => :create
  validates_confirmation_of :password
  validates_presence_of :email
  validates_uniqueness_of :email

  def hash_password
    if password.present?
      self.password_digest = Digest::MD5::hexdigest([email, "Application", password].join(":"))
    end
  end
end
