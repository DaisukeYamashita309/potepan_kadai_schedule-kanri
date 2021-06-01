class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.string :title
      t.date :begin_day
      t.date :finish_day
      t.string :all_day
      t.string :schejule_memo
      t.string :date_before_start
      t.string :after_begin_day

      t.timestamps
    end
  end
end
