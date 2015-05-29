class CreatePatterns < ActiveRecord::Migration
  def change
    create_table :patterns do |t|
      t.string :body
      t.timestamps
    end
  end
end
