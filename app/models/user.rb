class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :active_requests,class_name:  "Request", foreign_key: "host_id", dependent: :destroy
  has_many :passive_requests, class_name: "Request", foreign_key: "request_id", dependent: :destroy

  has_many :request, through: :active_requests
  has_many :hosts, through: :passive_requests, source: :host

  has_many :pets

  mount_uploader :image, ImageUploader

  def prefecture_name
    JpPrefecture::Prefecture.find(code: prefecture_id).try(:name)
  end

  def prefecture_name=(prefecture_name)
    self.prefecture_id = JpPrefecture::Prefecture.find(name: prefecture_name).code
  end


  def request?(other_user)
    request.include?(other_user)
  end

  def matchers
    request & hosts
  end


end
