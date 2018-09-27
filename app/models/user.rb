class User < ApplicationRecord

  attr_writer :password_confirmation

  has_many :author_tests, class_name: 'Test', foreign_key: :author_id,
           dependent: :nullify
  has_many :test_passages, dependent: :destroy
  has_many :tests, through: :test_passages

  validates :name, presence: true
  validates :email, presence: true
  validates :password, confirmation: true

  has_secure_password

  def test_by_level(level)
    tests.by_level(level)
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test: test)
  end
    
end
