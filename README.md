# テーブル設計

## users テーブル

| Column              | Type   | Options     |
| ------------------- | ------ | ----------- |
| nickname            | string | null: false |
| email               | string | null: false,unique: true|
| encrypted_password  | string | null: false |
| last_name           | string | null: false |
| first_name          | string | null: false |
| last_name_name      | string | null: false |
| first_name_name     | string | null: false |
| birthday            | date   | null: false |

### Association

- has_many :items
- has_many :buyers





## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| name               | string     | null: false |
| text               | text       | null: false |
| category_id        | integer    | null: false |
| condition_id       | integer    | null: false |
| charge_bearer_id   | integer    | null: false |
| shipping_area_id   | integer    | null: false |
| delivary_day_id   | integer    | null: false |
| price              | integer    | null: false |
| user               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- has_one :buyer




## buyers テーブル

| Column             | Type       | Options                       |
| ------------------ | ---------- | ----------------------------- |
| user               | references | null: false, foreign_key: true|
| item               | references | null: false, foreign_key: true|

### Association

- belongs_to :user
- belongs_to :item
- has_one :user_address



## user_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_number        | string | null: false |
| prefecture_id      | string | null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| bilding_name       | string |             |
| phone_number       | string | null: false |
| buyer              | references | null: false, foreign_key: true|


### Association

- belongs_to :buyer