class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, 
         :registerable,
         :recoverable, 
         :rememberable, 
         :validatable,
         :trackable,
         :confirmable

  attr_writer :password_confirmation

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id,
           dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages
  has_many :gists, dependent: :destroy
      
  validates :email, presence: true, format: { with: /@/ },
                                    uniqueness: true
  validates :password, confirmation: true

  def admin?
    self.is_a?(Admin)
  end  

  def test_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
    
end
