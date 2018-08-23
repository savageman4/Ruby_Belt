require 'rails_helper'

RSpec.describe IdeaController, type: :controller do

  describe "GET #display_ideas" do
    it "returns http success" do
      get :display_ideas
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #display_idea_likes" do
    it "returns http success" do
      get :display_idea_likes
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #display_user_details" do
    it "returns http success" do
      get :display_user_details
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #new_idea" do
    it "returns http success" do
      get :new_idea
      expect(response).to have_http_status(:success)
    end
  end

end
