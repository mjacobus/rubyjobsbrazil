# frozen_string_literal: true

require 'rails_helper'

describe ArticlesController, type: :controller do
  include ControllersSpecHelpers

  let(:published) { Article.make! }
  let(:unpublished) { Article.make!(published: false) }

  describe 'GET index' do
    before do
      published
      unpublished
    end

    it 'assigns published articles' do
      get :index
      expect(assigns(:articles)).to eq([published])
    end

    it 'responds with success' do
      get :index
      expect(response).to be_successful
    end
  end

  describe 'GET show' do
    context 'with published record' do
      before do
        get :show, params: { id: published.to_param }
      end

      it 'responds with success' do
        expect(response).to be_successful
      end

      it 'assigns @article' do
        expect(assigns(:article)).to eq(published)
      end
    end

    context 'with unpublished article' do
      it 'raises error' do
        expect do
          get :show, params: { id: unpublished.to_param }
        end.to raise_error(ActiveRecord::RecordNotFound)
      end
    end

    context 'when url is not canonical' do
      it 'redirects to the canonical' do
        get :show, params: { id: published.id }
        expect(response).to redirect_to([published])
      end
    end
  end
end
