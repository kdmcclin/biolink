class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.string 		:country
    	t.string 		:state
    	t.string 		:hospital
    	t.datetime 		:birthday
        t.string        :generation
    	t.text			:content
    	t.belongs_to 	:user

        t.timestamps
    end
  end
end
