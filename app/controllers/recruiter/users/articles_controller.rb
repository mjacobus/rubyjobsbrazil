module Recruiter
  module Users
    class ArticlesController < UserController
      before_action :set_article, only: [:show, :edit, :update, :destroy]

      def index
        @articles = articles.page(page).per(per_page)
        respond_with(:user, @articles)
      end

      def show
        respond_with(:user, @article)
      end

      def new
        @article = user_articles.build
        respond_with(:user, @article)
      end

      def create
        @article = user_articles.build(article_params)
        crud_flash @article.save
        respond_with(:user, @article)
      end

      def edit
        respond_with(:user, @article)
      end

      def update
        crud_flash @article.update(article_params)
        respond_with(:user, @article)
      end

      def destroy
        crud_flash @article.destroy
        respond_with(:user, @article)
      end

      private

      def articles
        return Recruiter::Article.all if current_user.admin?
        current_user.articles
      end

      def user_articles
        current_user.articles
      end

      def set_article
        @article = articles.find(params[:id])
      end

      def article_params
        params.require(:article).permit(:title, :body, :published)
      end
    end
  end
end
