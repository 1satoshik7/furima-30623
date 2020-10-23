# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| encrypted_password | string              | null: false             |
| date               | text                | null: false             |
| nickname           | string              | null: false             |
| sur_name           | string              | null: false             |
| name               | string              | null: false             |
| sur_name_ruby      | string              | null: false             |
| name_ruby          | string              | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column            | Type       | Options           |
|-------------------|------------|-------------------|
| name              | string     | null: false       |
| description       | text       | null: false       |
| category_id       | integer    | null: false       |
| product_status_id | integer    | null: false       |
| price             | integer    | null: false       |
| freight_id        | integer    | null: false       |
| shiptoaddress_id  | integer    | null: false       |
| shipdate_id       | integer    | null: false       |
| user              | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## order table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| item          | references | foreign_key: true |
| user          | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user
- has_one :address

## address table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| postal_code   | string     | null: false       |
| prefecture_id | integer    | null: false       |
| city          | string     | null: false       |
| house_number  | string     | null: false       |
| building      | string     |                   |
| tell          | string     | null: false       |
| order         | references | foreign_key: true |

### Association

- belongs_to :order