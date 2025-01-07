# spec/controllers/users_controller_spec.rb
require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:valid_attributes) do
    {
      email_address: "user@example.com",
      openloot_id: "test",
      password: "password123"
    }
  end

  let(:invalid_attributes) do
    {
      email_address: nil,
      openloot_id: "test",
      password: "password123"
    }
  end

  describe "POST #create" do
    context "when valid parameters are passed" do
      it "creates a new user" do
        # Simuler une requête POST avec des paramètres valides
        post :create, params: { user: valid_attributes }

        # Simuler un cookie signé pour la session
        allow(request.cookies).to receive(:signed).and_return({ session_id: "fake_session_id" })

        # Vérifiez que la session est trouvée correctement
        expect(Session.find_by(id: "fake_session_id")).to be_present
        expect(response).to have_http_status(:created)
      end
    end

    context "when invalid parameters are passed" do
      it "does not create a new user" do
        # Simuler une requête POST avec des paramètres invalides
        post :create, params: { user: invalid_attributes }

        # Simuler un cookie signé pour la session
        allow(request.cookies).to receive(:signed).and_return({ session_id: "fake_session_id" })

        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
