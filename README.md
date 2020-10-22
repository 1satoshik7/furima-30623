# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| user_name          | string              | null: false             |
| birth_date         | text                | null: false             |
| nickname           | text                | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column                              | Type       | Options           |
|-------------------------------------|------------|-------------------|
| product                             | string     | null: false       |
| product_description                 | text       | null: false       |
| category                            | text       | null: false       |
| product_status                      | references | null: false       |
| price                               | string     | null: false       |
| price_range                         | text       | null: false       |
| category                            | text       | null: false       |
| product_status                      | references | null: false       |
| user                                | references | foreign_key: true |

### Association

- belongs_to :user
- has_one :order

## order table

| Column        | Type       | Options           |
|---------------|------------|-------------------|
| freight       | text       | null: false       |
| shiptoaddress | references | null: false       |
| user          | references | null: false       |
| item          | references | foreign_key: true |
| user          | references | foreign_key: true |

### Association

- belongs_to :item
- belongs_to :user