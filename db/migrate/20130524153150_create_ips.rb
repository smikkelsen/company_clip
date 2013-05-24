class CreateIps < ActiveRecord::Migration
  def change
    create_table :ips do |t|
      t.string :address, :null => false, :limit => 64
      t.boolean :blacklisted

      t.timestamps
    end
  end
end
