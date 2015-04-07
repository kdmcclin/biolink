class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.text			:content, null: false
    	t.belongs_to	:user
    	t.belongs_to	:report

    	t.timestamps
    end
    add_index :comments, :user_id
    add_index :comments, :report_id
  end
end
