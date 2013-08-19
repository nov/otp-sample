class CreateAccounts < ActiveRecord::Migration
  def change
    create_table :accounts do |t|
      t.string :otp_seed, null: false
      t.timestamps
    end
  end
end
