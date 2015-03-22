class ChangeColumnDefault < ActiveRecord::Migration
  def change
    change_column_default :codes, :private, false
  end
end
