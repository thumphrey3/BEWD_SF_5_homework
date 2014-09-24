class CreateMuseums < ActiveRecord::Migration
  def change
    create_table :museums do |t|
      t.string :museum

      t.timestamps
    end
  end
end
