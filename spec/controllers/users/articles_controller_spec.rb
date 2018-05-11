# frozen_string_literal: true

require 'rails_helper'

describe Users::ArticlesController, type: :controller do
  include ControllersSpecHelpers

  let(:article) { user_article }

  let(:invalid_attributes) do
    {
      title: '',
      body: '',
      published: ''
    }
  end

  let(:valid_attributes) do
    {
      title: Article.make.title,
      body: Article.make.body,
      body: Article.make.body,
      published: '1'
    }
  end

  describe '#index' do
    it_requires_authentication { get :index }

    before do
      admin_article
      user_article
    end

    with_valid_user_or_admin do
      it_responds_with_success { get :index }
      it_renders_template(:index) { get :index }
    end

    with_admin_user do
      it 'lists all posts' do
        get :index
        expect(assigns(:articles)).to eq([admin_article, user_article])
      end
    end

    with_valid_user do
      it 'lists the posts that the user posted' do
        get :index
        expect(assigns(:articles)).to eq([user_article])
      end
    end
  end

  describe '#show' do
    it_requires_authentication { get :show, params: { id: 1 } }

    with_valid_user_or_admin do
      let(:article) { user_article }

      it 'assigns article to @article' do
        get :show, params: { id: article.id }
        expect(assigns(:article)).to eq(article)
      end

      it_responds_with_success { get :show, params: { id: article.id } }
      it_renders_template(:show) { get :show, params: { id: article.id } }
    end
  end

  describe '#new' do
    it_requires_authentication { get :new }

    with_admin_user do
      it 'assigns a new record to @article' do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
        expect(assigns(:article).user).to eq(admin)
      end
    end

    with_valid_user do
      it 'assigns a new record to @article' do
        get :new
        expect(assigns(:article)).to be_a_new(Article)
        expect(assigns(:article).user).to eq(user)
      end
    end

    with_valid_user_or_admin do
      it_responds_with_success { get :new }
      it_renders_template(:new) { get :new }
    end
  end

  describe '#create' do
    it_requires_authentication { post :create }

    with_admin_user do
      describe 'with valid attribbutes' do
        it 'creates a new admin record' do
          expect do
            post :create, params: { article: valid_attributes }
          end.to change { admin.articles.count }.by(1)
        end
      end
    end

    with_valid_user do
      describe 'with valid attribbutes' do
        it 'creates a new user article' do
          expect do
            post :create, params: { article: valid_attributes }
          end.to change { user.articles.count }.by(1)
        end
      end
    end

    with_valid_user_or_admin do
      describe 'with valid attributes' do
        it_sets_flash_message(:notice) { post :create, params: { article: valid_attributes } }

        it 'redirects to #show' do
          post :create, params: { article: valid_attributes }
          expect(response).to redirect_to([:user, Article.last])
        end
      end

      describe 'with invalid attributes' do
        it_responds_with_success { post :create, params: { article: invalid_attributes } }
        it_renders_template(:new) { post :create, params: { article: invalid_attributes } }
        it_sets_flash_message(:alert, true) { post :create, params: { article: invalid_attributes } }
      end
    end
  end

  describe '#edit' do
    it_requires_authentication { get :edit, params: { id: 1 } }

    with_valid_user_or_admin do
      it 'assigns article to @article' do
        get :edit, params: { id: article.id }
        expect(assigns(:article)).to eq(article)
      end

      it_responds_with_success { get :edit, params: { id: article.id } }
      it_renders_template(:edit) { get :edit, params: { id: article.id } }
    end
  end

  describe '#update' do
    it_requires_authentication { patch :update, params: { id: 1 } }

    with_valid_user_or_admin do
      before do
        article
      end

      describe 'with valid attributes' do
        it 'updates record' do
          expect do
            patch :update, params: { id: article.id, article: valid_attributes.merge(title: 'new title') }
            article.reload
          end.to change { article.title }.to('new title')
        end

        it 'redirects to #show' do
          patch :update, params: { id: article.id, article: valid_attributes.merge(description: 'new_description') }
          expect(response).to redirect_to([:user, Article.last])
        end

        it_sets_flash_message :notice do
          patch :update, params: { id: article.id, article: valid_attributes.merge(description: 'new_description') }
        end
      end

      describe 'with invalid attributes' do
        it_responds_with_success do
          patch :update, params: { id: article.id, article: invalid_attributes }
        end

        it_renders_template :edit do
          patch :update, params: { id: article.id, article: invalid_attributes }
        end

        it_sets_flash_message :alert, true do
          patch :update, params: { id: article.id, article: invalid_attributes }
          post :create, params: { article: invalid_attributes }
        end
      end
    end
  end

  describe '#destroy' do
    it_requires_authentication { delete :destroy, params: { id: 1 } }

    with_valid_user_or_admin do
      before do
        article
      end

      it 'destroys a record' do
        expect do
          delete :destroy, params: { id: article.id }
        end.to change { user.articles.count }.by(-1)
      end

      it 'redirects to #index' do
        delete :destroy, params: { id: article.id }
        expect(response).to redirect_to(%i[user articles])
      end

      it_sets_flash_message :notice do
        delete :destroy, params: { id: article.id }
      end
    end
  end
end
