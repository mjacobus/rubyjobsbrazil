# frozen_string_literal: true

require 'rails_helper'

describe Users::ArticlesController, 'routing', type: :routing do
  it 'routes to #index' do
    expect(get('profile/articles')).to route_to('users/articles#index')
    expect(get(user_articles_path)).to route_to('users/articles#index')
  end

  it 'routes to #show' do
    expect(get('profile/articles/1')).to route_to('users/articles#show', id: '1')
  end

  it 'routes to #new' do
    expect(get('profile/articles/new')).to route_to('users/articles#new')
  end

  it 'routes to #create' do
    expect(post('profile/articles')).to route_to('users/articles#create')
  end

  it 'routes to #edit' do
    expect(get('profile/articles/1/edit')).to route_to('users/articles#edit', id: '1')
  end

  it 'routes to #update' do
    expect(patch('profile/articles/1')).to route_to('users/articles#update', id: '1')
  end

  it 'routes to #destroy' do
    expect(delete('profile/articles/1')).to route_to('users/articles#destroy', id: '1')
  end
end
