class CreatePoints < ActiveRecord::Migration[5.0]
  def change
    create_table :points do |t|
      t.integer :receiver_id
      t.integer :giver_id
      t.integer :value
      t.integer :point_type
      t.text :reason

      t.timestamps
    end
  end
end
