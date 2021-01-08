class CreateSubscribeLogs < ActiveRecord::Migration[6.1]
  def change
    create_table :subscribe_logs do |t|
      t.text :token
      t.json :payload

      t.timestamps
    end
  end
end
