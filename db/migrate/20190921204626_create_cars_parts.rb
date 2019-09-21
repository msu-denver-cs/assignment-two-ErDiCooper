class CreateCarsParts < ActiveRecord::Migration[5.1]
  def change
    create_table :cars_parts do |t|

      t.timestamps
    end
  end
end
