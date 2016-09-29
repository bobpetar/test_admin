class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :bio, presence: true
  validates :birth_date, presence: true
  validate :picture_size
  
  mount_uploader :picture, PictureUploader
  
         
  def full_name
    return "#{first_name} #{last_name}".strip if (first_name || last_name)
    "Anonymous"
  end
  
  private
  
  def picture_size
    if picture.size > 5.megabytes
      errors.add(:picture, "Should be less than 5MB")
    end
  end
  
end
