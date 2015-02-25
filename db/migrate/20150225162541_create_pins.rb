class CreatePins < ActiveRecord::Migration
  def change
    create_table :pins do |t|
      t.string :title
      t.references :user, index: true
      t.text :description
      t.string :banner

      t.timestamps
    end
  end
end
