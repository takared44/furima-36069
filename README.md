# テーブル設計

## itemsテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|name                   |integer    |null:false,index:true       |
|text                   |integer    |null:false                  |
|status                 |integer    |null:false,default:0        |
|delivery_charge_bearer |integer    |null:false,default:0        |
|price                  |integer    |null:false                  |
|seller_id              |integer    |null:false,foreign_key:true |
|buyer_id               |integer    |foreign_key:true            |
|category_id            |integer    |null:false,foreign_key:true |
|prefecture_id          |integer    |null:false,default:0        |
|delivery/days          |integer    |null:false,default:0        |

### Association

- belongs_to :user
- belongs_to :category
- has_many :item_images,dependent:destroy

## categoriesテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|name                   |string     |null:false                  |

#### gem指定

 gem ancestry

### Association

- has_many :items
- has_ancestry

## item_imagesテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|src                    |string     |null:false                  |
|item_id                |references |null:false,foreign_key:true |

### Association

- belongs_to :item

## usersテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|nickname               |string     |null:false                  |
|email                  |string     |null:false,unique:true      |
|encrypted_password     |string     |null:false                  |

### Association

- has_one :profile,dependent: :destroy
- has_one :user_address,dependent: :destroy
- has_one :payment_card,dependent: :destroy
- has_many :items,dependent: :destroy,foreign_key: :items
- has_many :sns_credentials,dependent: :destroy

## profileテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|family_name            |string     |null:false                  |
|first_name             |string     |null:false                  |
|family_name_furigana   |string     |null:false                  |
|first_name_furigana    |string     |null:false                  |
|birthday               |date       |null:false                  |
|user_id                |references |null:false,foreign_key:true |

### Association

- belongs_to :user

## addressesテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|family_name            |string     |null:false                  |
|first_name             |string     |null:false                  |
|family_name_kana       |string     |null:false                  |
|first_name_kana        |string     |null:false                  |
|post_number            |string     |null:false                  |
|prefecture_id          |integer    |null:false,default: 0       |
|city                   |string     |null:false                  |
|house_number           |integer    |null:false                  |
|building_name          |string     |                            |
|phone_number           |string     |                            |
|user_id                |references |null:false,foreign_key:true |

### Association

- belongs_to :user

## payment_cardsテーブル

| Colum                 | Type      | Options                    |
|:----------------------|-----------|----------------------------|
|user_id                |references |null:false,foreign_key:true |
|customer_id            |string     |null:false                  |

### Association

- belongs_to :user




