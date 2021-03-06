require 'rails_helper'
require 'faker'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

RSpec.describe Api::V1::TagsController, type: :controller do

  let(:valid_attributes) {
    {
      data: {
        type: "tags",
        attributes: {
          label: Faker::Lovecraft.words(1)
        }
      }
    } 
  }

  let(:invalid_attributes) {
    {
      data: {
        type: "tags",
        attributes: {
          label: ''
        }
      }
    } 
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # Api::V1::TagsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "assigns all tags as @tags" do
      tag = Tag.create! valid_attributes[:data][:attributes]
      get :index, params: {}, session: valid_session
      expect(assigns(:tags)).to eq([tag])
    end
  end

  describe "GET #show" do
    it "assigns the requested tag as @tag" do
      tag = Tag.create! valid_attributes[:data][:attributes]
      get :show, params: valid_attributes.merge(id: tag.id), session: valid_session
      expect(assigns(:tag)).to eq(tag)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      let(:new_attributes) {
        {
          data: {
            type: "tags",
            attributes: { label: Faker::Lovecraft.words(1) }
          }
        }
      }

      it "assigns the requested tag as @tag" do
        tag = Tag.create! valid_attributes[:data][:attributes]
        put :update, params: new_attributes.merge(id: tag.id), session: valid_session
        expect(assigns(:tag)).to eq(tag)
      end
    end

    context "with invalid params" do
      it "returns a 422" do
        tag = Tag.create! valid_attributes[:data][:attributes]
        put :update, params: invalid_attributes.merge(id: tag.id)
        expect(response.status).to eq(422)
      end

    end
  end

  describe "DELETE #destroy" do
    before(:each) do
      @tag = create(:tag, :include_breeds)
    end
    it "destroys the requested tag" do
      expect {
        delete :destroy, params: {id: @tag.to_param}, session: valid_session
      }.to change(Tag, :count).by(-1)
    end

    it "destroys all assignments to breeds" do
      assignments = @tag.assignments
      expect {
        delete :destroy, params: {id: @tag.to_param}, session: valid_session
      }.to change(assignments, :count).to eq(0)
    end

    it "does not destroy assigned breeds" do
      expect {
        delete :destroy, params: {id: @tag.to_param}, session: valid_session
      }.to change(Breed, :count).by(0)
    end
  end

end
