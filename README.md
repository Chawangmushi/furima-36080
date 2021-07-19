# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| sirname            | string | null: false |
| firstname          | string | null: false |
| furigana           | string | null: false |
| birthday           | date   | null: false |

### Association

- has_many :items
- has_many :orders
- has_many :comments

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
- has_many :comments, dependent: :destroy
- has_one_attached :image //ActiveStorageで実装するため

## comments テーブル

| Column    | Type       | Options                        |
| --------- | ---------- | ------------------------------ |
| user      | references | null: false, foreign_key: true |
| item      | references | null: false, foreign_key: true |
| comment   | text       | null: false                    |

### Association

- belongs_to :user
- belongs_to :item

## orders テーブル

| Column  | Type       | Options                        |
| ------- | ---------- | ------------------------------ |
| user    | string     | null: false, foreign_key: true |
| item    | references | null: false, foreign_key: true |

### Association

- belongs_to :item
- has_one :shipping

## shipping テーブル

| Column  | Type               | Options                         |
| ---------------- | ---------- | ------------------------------ |
| postalcode       | integer    | null: false                    |
| shipping_from_id | integer    | null: false                    | //Active Hashを使う
| city             | string     | null: false                    |
| banchi           | string     | null: false                    |
| building_name    | string     |                                | //空白OKにする
| phone            | integer    | null: false                    |
| order            | references | null: false, foreign_key: true |


### Association

- belongs_to :order