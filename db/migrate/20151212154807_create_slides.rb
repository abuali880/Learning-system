class CreateSlides < ActiveRecord::Migration
  def change
    create_table :slides do |t|
      t.string :urlpage
      t.references :lecture 
      t.timestamps null: false
    end
  end
end
