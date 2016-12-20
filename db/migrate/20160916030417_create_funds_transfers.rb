class CreateFundsTransfers < ActiveRecord::Migration
  def change
    create_table :funds_transfers do |t|
      t.belongs_to :from, index: true, foreign_key: true
      t.belongs_to :to, index: true, foreign_key: true
      t.string :memo
      t.integer :amount

      t.timestamps null: false
    end
  end
end
