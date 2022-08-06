# テーブル設計

## users テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| nickname           | string | null: false |
| email              | string | null: false,unique: true|
| password           | string | null: false |

### Association

- has_many :items
- has_many :buyers





## items テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| image              | string     | null: false |
| name               | string     | null: false |
| text               | text       | null: false |
| category           | integer    | null: false |
| condition          | integer    | null: false |
| charge_bearer      | integer    | null: false |
| shipping_area      | integer    | null: false |
| delivary_days      | integer    | null: false |
| price              | integer    | null: false |
| users_id           | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- has_one :buyers




## buyers テーブル

| Column             | Type       | Options     |
| ------------------ | ---------- | ----------- |
| users_id           | references | null: false, foreign_key: true|
| items_id           | references | null: false, foreign_key: true|

### Association

- belongs_to :users
- belongs_to :items
- has_one :user_address



## user_address テーブル

| Column             | Type   | Options     |
| ------------------ | ------ | ----------- |
| post_number        | string | null: false |
| prefectures        | string | null: false |
| city               | string | null: false |
| house_number       | string | null: false |
| bilding_number     | string | null: false |
| phone_number       | string | null: false |
| buyers_id          | references | null: false, foreign_key: true|


### Association

- belongs_to :buyers