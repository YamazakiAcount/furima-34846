require 'rails_helper'
RSpec.describe Item, type: :model do
  describe "商品出品機能" do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品出品できるとき' do
      it 'name,description,category,condition,delivery_fee,prefecture,delivery_day,priceが存在すれば登録できること' do
        expect(@item).to be_valid
      end
    end
    context '商品出品できないとき' do
      it '商品画像を1枚つけなければ出品できないこと' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名が空では出品できないこと' do
        @item.name = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明が空では出品できないこと' do
        @item.description = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Description can't be blank")
      end

      it 'カテゴリーの情報が空では出品できないこと' do
        @item.category_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      
      it '商品の状態についての情報が空では出品できないこと' do
        @item.condition_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition must be other than 1")
      end

      it '配送料の負担についての情報が空では出品できないこと' do
        @item.delivery_fee_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee must be other than 1")
      end

      it '発送元の地域についての情報が空では出品できないこと' do
        @item.prefecture_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
      end

      it '発送までの日数についての情報が空では出品できないこと' do
        @item.delivery_day_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery day must be other than 1")
      end

      it '販売価格についての情報が空では出品できないこと' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '販売価格は、¥300~¥9,999,999の間のみでしか出品できないこと' do
        @item.price = 200
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格は半角数字のみでしか出品できないこと' do
        @item.price = "５００"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

      it '販売価格は半角数字のみでしか出品できないこと' do
        @item.price = "five hundred"
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not included in the list")
      end

    #it "入力された販売価格によって、販売手数料や販売利益の表示が変わること" do
    #end
    #it "必要な情報を適切に入力すると、商品情報がデータベースに保存されること" do
    #end
    #it "エラーハンドリングができていること（入力に問題がある状態で「出品する」ボタンが押された場合、情報は保存されず、出品ページに戻りエラーメッセージが表示されること）" do
    #end
    #it "エラーハンドリングの際、1つのエラーに対して同じエラーメッセージが重複して表示されないこと" do
    #end
    end
  end
end
