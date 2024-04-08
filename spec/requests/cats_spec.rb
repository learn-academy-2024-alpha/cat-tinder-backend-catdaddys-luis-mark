require 'rails_helper'

RSpec.describe "Cats", type: :request do
  describe "GET /index" do
    it "gets a list of cats" do
      Cat.create(
        name: 'Felix',
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      get '/cats'
      cat = JSON.parse(response.body)
      expect(response).to have_http_status(200)
      expect(cat.length).to eq 1
    end
  end
  describe "POST /create" do
    it "creates a cat" do
      cat_params = {
        cat: {
          name: 'Buster',
          age: 4,
          enjoys: 'Meow Mix, and plenty of sunshine.',
          image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
        }
      }
      post '/cats', params: cat_params
      expect(response).to have_http_status(200)
      cat = Cat.first
      expect(cat.name).to eq 'Buster'
    end
  end
  describe "PUT /update" do
    it "updates a cat" do
      cat = Cat.create(
        name: 'Whiskers',
        age: 3,
        enjoys: 'Napping in the sun',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      )
      update_params = {
        cat: {
          name: 'Whiskers Jr.',
          age: 4,
          enjoys: 'Chasing butterflies',
          image: 'https://new-image-url.com'
        }
      }
      put "/cats/#{cat.id}", params: update_params
      expect(response).to have_http_status(200)
      cat.reload
      expect(cat.name).to eq 'Whiskers Jr.'
      expect(cat.age).to eq 4
      expect(cat.enjoys).to eq 'Chasing butterflies'
      expect(cat.image).to eq 'https://new-image-url.com'
    end
  end
  describe "DELETE /destroy" do
    it "deletes a cat" do
      cat = Cat.create(
        name: 'Whiskers',
        age: 3,
        enjoys: 'Napping in the sun',
        image: 'https://example.com/cat.jpg'
      )
      expect {
        delete "/cats/#{cat.id}"
      }.to change(Cat, :count).by(-1)
      expect(response).to have_http_status(200)
    end
  end
  it "doesn't create a cat without a name" do
    cat_params = {
      cat: {
        age: 2,
        enjoys: 'Walks in the park',
        image: 'https://images.unsplash.com/photo-1529778873920-4da4926a72c2?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1036&q=80'
      }
    }
    post '/cats', params: cat_params
    expect(response.status).to eq 422
    json = JSON.parse(response.body)
    expect(json['name']).to include "can't be blank"
  end
  
  describe "PATCH /cats/:id" do
    let!(:cat) { Cat.create(name: "Mittens", age: 4, enjoys: "Sitting on laps", image: "http://example.com/mittens.jpg") }
  
    it "returns a 422 error if the enjoys field is less than 10 characters" do
      update_params = {
        cat: {
          enjoys: "Too short" 
        }
      }
      patch "/cats/#{cat.id}", params: update_params
      expect(response.status).to eq 422
      json = JSON.parse(response.body)
      expect(json['errors']['enjoys']).to include "is too short (minimum is 10 characters)"
    end
  end
end