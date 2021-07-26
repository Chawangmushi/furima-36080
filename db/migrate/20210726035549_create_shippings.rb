class CreateShippings < ActiveRecord::Migration[6.0]
  def change
    create_table :shippings do |t|

      create_table :addresses do |t|
        t.string :postalcode,          null: false
        t.integer :shipping_from_id,   null: false
        t.string :city,                null: false
        t.string :banchi,              null: false
        t.string :building_name 
        t.string :phone,               null: false
        t.references :order,           null: false, foreign_key: true

        t.timestamps
    end
  end
end

| Column  | Type                | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | string     | null: false                    |
| shipping_from_id | integer    | null: false                    | //Active Hashを使う
| city             | string     | null: false                    |
| banchi           | string     | null: false                    |
| building_name    | string     |                                | //空白OKにする
| phone            | string     | null: false                    |
| order            | references | null: false, foreign_key: true |
