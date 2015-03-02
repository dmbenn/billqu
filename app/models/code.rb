class Code < ActiveRecord::Base
  belongs_to :user
  
  def private?
    private == 1
  end
  
  
end
