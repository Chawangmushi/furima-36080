# テーブル設計

## users テーブル

| Column             | Type   | Options                    |
| ------------------ | ------ | -------------------------- |
| nickname           | string | null: false                |
| email              | string | null: false, unique: true  |
| encrypted_password | string | null: false                |
| surname            | string | null: false                |
| givenname          | string | null: false                |
| surname_furigana   | string | null: false                |
| givenname_furigana | string | null: false                |
| birthday           | date   | null: false                |

### Association

- has_many :items
- has_many :orders

## items テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| name                  | string     | null: false                    |
| description           | text       | null: false                    |
| price                 | integer    | null: false                    |
| category_id           | integer    | null: false                    | //Active Hashを使う
| condition_id          | integer    | null: false                    | //Active Hashを使う
| shipping_payment_id   | integer    | null: false                    | //Active Hashを使う
| shipping_from_id      | integer    | null: false                    | //Active Hashを使う
| shipping_day_id       | integer    | null: false                    | //Active Hashを使う
| user                  | references | null: false, foreign_key: true |


### Association

- belongs_to :user
- has_one :order
- has_one_attached :image //ActiveStorageで実装するため


## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | references | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column  | Type                | Options                        |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | string     | null: false                    |
| shipping_from_id | integer    | null: false                    | //Active Hashを使う
| city             | string     | null: false                    |
| banchi           | string     | null: false                    |
| building_name    | string     |                                | //空白OKにする
| phone            | string     | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order