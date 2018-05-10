require "rails_helper"

describe ArticlesController, "routing", type: :routing do

  it "routes to #index" do
    expect(get('/articles')).to route_to('articles#index')
    expect(get(articles_path)).to route_to('articles#index')
  end

  it "routes to #show" do
    expect(get('articles/1')).to route_to('articles#show', id: '1')
    expect(get(article_path(1))).to route_to('articles#show', id: '1')
  end
end
