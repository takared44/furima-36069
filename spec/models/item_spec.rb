require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
   @item = FactoryBot.build(:item)
  end

describe '商品出品登録' do
  context '商品出品登録がうまくいくとき' do
    it 'produt_name,text,price,category_id,state_id,delivery_fee_id,delivery_prefecture_id,delivery/date_id が存在すれば登録できる' do
      expect(@item).to be_valid
    end
  end
  context '商品出品がうまくいかないとき' do
    it '画像が空だとできない' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("")
    end
      it '商品名が空だと登録できない' do
        @item.product_name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '商品の説明が空だと登録できない' do
        @item.text= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it 'カテゴリーが空だと登録できない' do
        @item.category_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it 'カテゴリーが1だと登録できない' do
        @item.category_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '商品の状態が空だと登録できない' do
        @item.state_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '商品の状態が1だと登録できない' do
        @item.state_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '商配送料が空だと登録できない' do
        @item.delivery_fee_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '商配送料が1だと登録できない' do
        @item.delivery_fee_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '配送元の地域が空だと登録できない' do
        @item.delivery_prefecture_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '配送元の地域が1だと登録できない' do
        @item.delivery_prefecture_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '発想までの日数が空だと登録できない' do
        @item.delivery_date_id= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '発想までの日数が1だと登録できない' do
        @item.delivery_date_id= 1
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '価格が空だと登録できない' do
        @item.price= ''
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '価格範囲が300未満だと登録できない' do
        @item.price= '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '価格範囲が9,999,999より大きいと登録できない' do
        @item.price= '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
      it '価格は半角数字でなければ登録できない' do
        @item.price= '１０００'
        @item.valid?
        expect(@item.errors.full_messages).to include("")
      end
    end
  end
end

  
  