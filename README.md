# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false , unique: true|
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Association
 has_many:items
 has_many:records

## items テーブル

| Column          | Type    | Options     |
| --------------- | ------- | ----------- |
| name            | string  | null: false |
| description     | text    | null: false |
| category_id     | integer | null: false |
| delivery_fee_id | integer | null: false |
| prefecture_id   | integer | null: false |
| delivery_day_id | integer | null: false |
| price           | integer | null: false |
| user_id         | integer | null: false |
| condition       | text    | null: false |

### Association
belongs_to :user
has_one :record

## record テーブル

| Column    | Type       | Options     |
| --------- | ---------- | ----------- |
| user      | references | null: false |
| item      | references | null: false |

### Association
belongs_to :item
belongs_to :address
belongs_to :users

## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture_id      | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building name      | string |
| phone_number       | string | null: false |
| order_id           | string | foreign_key: true |

### Association
has_one :record
