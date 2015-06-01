class CreateCharacterReceptors < ActiveRecord::Migration
  def change
    create_table :character_receptors do |t|
      t.string :character, null: false
      t.integer :neuron_id, null: false
    end
  end
end
