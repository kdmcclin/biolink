class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.string 		:country
    	t.string 		:state
    	t.string 		:hospital
    	t.datetime 		:birthday
        t.string        :generation, null: false
    	t.text			:content, null: false
    	t.belongs_to 	:user

        t.timestamps
    end
    add_index :reports, :user_id
  end
end
