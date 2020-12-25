require 'rails_helper'
require 'factories/tags'
RSpec.describe Tag, type: :model do
  describe 'Model spec/單元測試' do
    context '如果標籤建立成功' do
      it '欄位正確填寫完成',tag: true do
        tag =FactoryBot.build(:tag)
        expect(tag).to be_valid
      end
      # it '標籤名字不能空白',tags:true do
      #   tag=FactoryBot.build(:tag,name:'')
      #   except{
      #          except(tag).to be_valid
      #   }.to raise_exception(/Name 不能空白/)
        
      # end
    end
  end
end
