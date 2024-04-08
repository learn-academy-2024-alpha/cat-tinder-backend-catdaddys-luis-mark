require 'rails_helper'

RSpec.describe Cat, type: :model do
    it "should validate name" do
        cat = Cat.create(age: 2, enjoys:'Walks in the park and drinking milk', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
        expect(cat.errors[:name]).to_not be_empty
      end
    it "should validate age" do
        cat = Cat.create(name: 'Whiskers', enjoys:'Walks in the park and drinking milk', image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80', age: nil)
        expect(cat.errors[:age]).to_not be_empty
      end
    it "should validate enjoys" do
        cat = Cat.create(name: 'Whiskers', age: 2, image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80')
        expect(cat.errors[:enjoys]).to_not be_empty
      end
    it "should validate image" do
        cat = Cat.create(name: 'Whiskers', age: 2, enjoys:'Walks in the park and drinking milk')
        expect(cat.errors[:image]).to_not be_empty
      end
      
      it 'is valid if enjoys is at least 10 characters' do
        cat = Cat.create(name: 'mark', age: 4, enjoys:'Chasing mice and killing birds', image: 'gibberish')
        expect(cat).to be_valid
      end

      it 'is invalid if enjoys is shorter than 10 characters' do
        cat = Cat.create(name: 'mark', age: 4, enjoys:'mice', image: 'gibberish')
        expect(cat).to be_invalid
      end
end
