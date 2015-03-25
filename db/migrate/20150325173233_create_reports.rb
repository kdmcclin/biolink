class CreateReports < ActiveRecord::Migration
  def change
    create_table :reports do |t|
    	t.string 		:country
    	t.string 		:state
    	t.string 		:hospital
    	t.datetime 		:birthday
    	t.text			:content
    	t.belongs_to 	:user
    end
  end
end
