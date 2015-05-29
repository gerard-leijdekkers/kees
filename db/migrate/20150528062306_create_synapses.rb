class CreateSynapses < ActiveRecord::Migration
  def change
    create_table :synapses do |t|
      t.integer :from
      t.integer :to
      t.timestamps
    end
  end
end
