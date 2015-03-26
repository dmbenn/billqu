class CreateCodes < ActiveRecord::Migration
  def change
    create_table :codes do |t|
      t.text :body
      t.boolean :private
      t.timestamps
    end
  end
end
