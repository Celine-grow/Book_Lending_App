class CreateBorrowingHistories < ActiveRecord::Migration[8.0]
  def change
    create_table :borrowing_histories do |t|
      t.references :book, null: false, foreign_key: true
      t.string :borrower_name, null: false
      t.datetime :borrowed_at, null: false
      t.datetime :returned_at
      t.timestamps
    end
  end
end
