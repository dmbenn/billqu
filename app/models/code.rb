class Code < ActiveRecord::Base
  
  has_and_belongs_to_many :users, join_table: "editors"
  
  def private?
    private == true
  end
  
  def public?
    private == false
  end

end
