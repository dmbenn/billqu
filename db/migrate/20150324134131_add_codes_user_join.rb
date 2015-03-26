class AddCodesUserJoin < ActiveRecord::Migration
  def change
    create_table :editors do |t|
      t.belongs_to :user, index: true
      t.belongs_to :code, index: true
    end
  end
end
