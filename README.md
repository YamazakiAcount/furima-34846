# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false |
| encrypted_password | string | null: false |
| family_name        | string | null: false |
| first_name         | string | null: false |
| family_name_kana   | string | null: false |
| first_name_kana    | string | null: false |
| birth_day          | date   | null: false |


### Association
 has_many:items
 has_many:record

## items テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| name         | string  | null: false |
| description  | text    | null: false |
| category     | string  | null: false |
| delivery_fee | integer | null: false |
| prefecture   | string  | null: false |
| delivery_day | string  | null: false |
| price        | integer | null: false |
| user_id      | integer | null: false |

### Association
belongs_to :users
has_one :record

## record テーブル

| Column       | Type    | Options     |
| ------------ | ------- | ----------- |
| user_id      | string  | null: false |
| item_id      | string  | null: false |

### Association
belongs_to :items
belongs_to :address
belongs_to :users

## address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_code          | string | null: false |
| prefecture         | string | null: false |
| city               | string | null: false |
| address            | string | null: false |
| building name      | string |
| phone_number       | string | null: false |
| order_id           | string | null: false |

### Association
has_one :record
