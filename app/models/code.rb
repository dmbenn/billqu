class Code < ActiveRecord::Base
  
  belongs_to :user, dependent: :destroy
  
  def private?
    private == true
  end

  scope :visable_to, -> (user) { user ? where("private = ? OR user_id = ?", false, user.id) : where(private: false) }

end
