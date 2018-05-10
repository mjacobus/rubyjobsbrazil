# frozen_string_literal: true

class ArticlesController < ApplicationController
  respond_to :html, :json

  def index
    @articles = scope
    respond_with(@articles)
  end

  def show
    @article = scope.find(params[:id])
    ensure_canonical_url(@article) do
      respond_with(@article)
    end
  end

  private

  def scope
    Article.published
  end
end
