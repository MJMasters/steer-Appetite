class CreatePubs < ActiveRecord::Migration
  def change
    create_table :pubs do |t|
		t.string :name
		t.string :address
		t.integer :rating
		t.float :latitude
		t.float :longitude
      	t.timestamps
    end
  end
end
