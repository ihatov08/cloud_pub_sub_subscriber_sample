class AddParamsToSubscribeLogs < ActiveRecord::Migration[6.1]
  def change
    add_column :subscribe_logs, :params, :json
  end
end
