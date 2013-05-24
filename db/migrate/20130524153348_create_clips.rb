class CreateClips < ActiveRecord::Migration
  def change
    create_table :clips do |t|
      t.references :ip
      t.text :text
      t.string :encryption, :limit => 128

      t.timestamps
    end
    add_index :clips, :ip_id
  end
end
