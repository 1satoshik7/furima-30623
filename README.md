# DB 設計

## users table

| Column             | Type                | Options                 |
|--------------------|---------------------|-------------------------|
| email              | string              | null: false             |
| password           | string              | null: false             |
| birth_date         | text                | null: false             |
| nickname           | text                | null: false             |
| sur_name           | text                | null: false             |
| name               | text                | null: false             |
| sur_name(ruby)     | text                | null: false             |
| name(ruby)         | text                | null: false             |

### Association

* has_many :items
* has_many :orders

## items table

| Column         | Type       | Options           |
|----------------|------------|-------------------|
| name           | string     | null: false       |
| description    | text       | null: false       |
| category       | integer    | null: false       |
| product_status | integer    | null: false       |
| price          | integer    | null: false       |
| freight        | integer    | null: false       |
| shiptoaddress  | integer    | null: false       |
| shipdate       | integer    | null: false       |
| user           | references | foreign_key: true |

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

| Column | Type       | Options           |
|--------|------------|-------------------|
| order  | references | foreign_key: true |

### Association

- belongs_to :order