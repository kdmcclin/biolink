class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
    	t.string		:title
    	t.text			:content
    	t.belongs_to	:user
    	t.belongs_to	:report
    end
  end
end
