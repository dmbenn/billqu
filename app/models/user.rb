class User < ActiveRecord::Base
  
  after_initialize :init
  
  has_and_belongs_to_many :codes, join_table: "editors"
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable
  
  def upgrade
    self.update_attribute(:role, "premium")
  end
  
  def downgrade
    self.update_attribute(:role, "standard")
  end
  
  
  def admin?
    role == 'admin'
  end
 
  def standard?
    role == 'standard'
  end
  
  def premium?
    role == 'premium'
  end
  
  def init
    self.role ||= 'standard'           #will set the default value only if it's nil
  end
  
end
