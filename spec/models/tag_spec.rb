require 'rails_helper'
require 'factories/tags'
RSpec.describe Tag, type: :model do
  describe 'Model spec/單元測試' do
    context '如果標籤建立成功' do
      it '欄位正確填寫完成',tag: true do
        tag =FactoryBot.build(:tag)
        expect(tag).to be_valid
      end
      it '標籤名字不能空白',tags: true do
        tag=FactoryBot.build(:tag,name: '')
        expect{
                expect(tag).to be_valid
              }.to raise_exception(/Name can't be blank/)
        
      end
      it '標籤名字必須唯一',tags: true do
        tag1=FactoryBot.create(:tag,name: 'box')
        tag2=FactoryBot.build(:tag,name: 'box')
        expect{
                expect(tag2).to be_valid
              }.to raise_exception(/Name has already been taken/)
        
      end
      it '標籤名字不能太長',tags: true do
        tag=FactoryBot.build(:tag,name: 'k'*26)
        expect{
                expect(tag).to be_valid
              }.to raise_exception(/Name is too long/)
        
      end
      it '標籤名字不能太短',tags: true do
        tag=FactoryBot.build(:tag,name: 'k'*2)
        expect{
                expect(tag).to be_valid
              }.to raise_exception(/Name is too short/)
        
      end
    end
  end
end
