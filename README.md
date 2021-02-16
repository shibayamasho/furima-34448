# テーブル設計

## users テーブル

| Column              | Type    | Options                   |
| ------------------- | ------- | ------------------------- |
| nickname            | string  | null: false               |
| email               | string  | null: false, unique: true |
| encrypted_password  | string  | null: false               |
| last_name           | string  | null: false               |
| first_name          | string  | null: false               |
| last_name_katakana  | string  | null: false               |
| first_name_katakana | string  | null: false               |
| birthday            | date    | null: false               |

### Association

- has_many :items
- has_many :purchases

## items テーブル

| Column          | Type       | Options                        |
| --------------- | ---------- | ------------------------------ |
| item_name       | string     | null: false                    |
| item_text       | text       | null: false                    |
| category        | string     | null: false                    |
| condition       | string     | null: false                    |
| delivery_fee    | string     | null: false                    |
| shipment_source | string     | null: false                    |
| days_to_ship    | string     | null: false                    |
| price           | integer    | null: false                    |
| user            | references | null: false, foreign_key: true |

### Association

- belongs_to :user
- has_one :purchase

## purchases テーブル

| Column                | Type       | Options                        |
| --------------------- | ---------- | ------------------------------ |
| card_number           | string     | null: false                    |
| expiration_date_month | string     | null: false                    |
| expiration_date_year  | string     | null: false                    |
| security_code         | string     | null: false                    |
| user                  | references | null: false, foreign_key: true |
| item                  | references | null: false, foreign_key: true |

### Association

- belongs_to :users
- belongs_to :item
- has_one :address

## addresses テーブル

| Column         | Type       | Options                        |
| -------------- | ---------- | ------------------------------ |
| postal_code    | string     | null:false                     |
| prefectures    | string     | null:false                     |
| municipalities | string     | null:false                     |
| address        | string     | null:false                     |
| building_name  | string     |                                |
| phone_number   | string     | null:false                     |
| purchase       | references | null: false, foreign_key: true |

### Association

- belongs_to :purchase