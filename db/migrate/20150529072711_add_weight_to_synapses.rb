class AddWeightToSynapses < ActiveRecord::Migration
  def change
    add_column :synapses, :weight, :integer, default: 5
  end
end
