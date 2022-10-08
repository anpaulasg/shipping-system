class CreateDeliberies < ActiveRecord::Migration[7.0]
  def change
    create_table :deliberies do |t|

      t.timestamps
    end
  end
end
