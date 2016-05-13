class CreateCommentforlectures < ActiveRecord::Migration
  def change
    create_table :commentforlectures do |t|
      t.references :lecture, index: true, foreign_key: true
      t.string :body

      t.timestamps null: false
    end
  end
end
