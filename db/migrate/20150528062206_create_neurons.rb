class CreateNeurons < ActiveRecord::Migration
  def change
    create_table :neurons do |t|
      t.timestamps
    end
  end
end
