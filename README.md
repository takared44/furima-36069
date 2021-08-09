# テーブル設計

## usersテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|nickname               |string     |null:false                  |
|email                  |string     |null:false,unique:true      |
|encrypted_password     |string     |null:false                  |
|last_name              |string     |null:false                  |
|first_name             |string     |null:false                  |
|last_name_kana         |string     |null:false                  |
|first_name_kana        |string     |null:false                  |
|birthday               |date       |null:false                  |

### Association

- has_many :items
- has_many :records

## itemsテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|product_name           |string     |null:false                  |
|text                   |text       |null:false                  |
|price                  |integer    |null:false                  |
|user                   |references |null:false,foreign_key:true |
|category_id            |integer    |null:false                  |
|state_id               |integer    |null:false                  |
|delivery_fee_id        |integer    |null:false                  |
|delivery_prefecture_id |integer    |null:false                  |
|delivery_date_id       |integer    |null:false                  |

### Association

- belongs_to :user
- has_one_attached:image
- has_one:record

## recordsテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|user                   |references |null:false,foreign_key:true |
|item                   |references |null:false,foreign_key:true |


### Association

- belongs_to:item
- belongs_to:user
- has_one:address

## addressesテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|postcode               |string     |null:false                  |
|prefecture_id          |integer    |null:false                  |
|city                   |string     |null:false                  |
|bloc                   |string     |null:false                  |
|building               |string     |                            |
|phone                  |string     |null:false                  |
|record                 |references |null:false,foreign_key:true |


### Association

- belongs_to :record







