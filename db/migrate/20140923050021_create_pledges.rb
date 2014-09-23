class CreatePledges < ActiveRecord::Migration
  def change
    create_table :pledges do |t|
      t.string :name
      t.string :email
      t.integer :amount
      t.references :project, index: true

      t.timestamps
    end
  end
end
