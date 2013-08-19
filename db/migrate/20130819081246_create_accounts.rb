class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :identifier, null: false
      t.string :otp_seed,   null: false
      t.timestamps
    end
    add_index :accounts, :identifier, unique: true
  end
end
