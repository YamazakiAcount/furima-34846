require 'rails_helper'
RSpec.describe RecordAddress, type: :model do
  describe "商品購入機能" do
    before do
      @user = FactoryBot.create(:user)
      @item = FactoryBot.create(:item)
      @record = FactoryBot.build(:record_address, user_id: @user.id, item_id: @item.id)
      sleep(1)
    end
    context '必要な情報を適切に入力すると、商品の購入ができること' do
      it 'token,prefecture_id,city,address,phone_numberが存在すれば登録できること' do
        expect(@record).to be_valid
      end
    end
    context '商品購入ができないとき' do
      it "tokenが空では登録できない" do
        @record.token = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Token can't be blank")
      end
      it "post_codeが空では登録できない" do
        @record.post_code = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Post code can't be blank")
      end
      it "post_codeにはハイフンが必要であること" do
        @record.post_code = "1112222"
        @record.valid?
        expect(@record.errors.full_messages).to include("Post code is invalid. Input half-width characters.")
      end
      it "prefecture_idが空では登録できない" do
        @record.prefecture_id = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Prefecture can't be blank")
      end
      it "cityが空では登録できない" do
        @record.city = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("City can't be blank")
      end
      it "addressが空では登録できない" do
        @record.address = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Address can't be blank")
      end
      it "phone_numberが空では登録できない" do
        @record.phone_number = nil
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number can't be blank")
      end
      it "phone_numberは11桁以内の数値のみ保存可能なこと" do
        @record.phone_number = "090123456789"
        @record.valid?
        expect(@record.errors.full_messages).to include("Phone number is invalid. Input half-width characters.")
      end
    end
  end

end
