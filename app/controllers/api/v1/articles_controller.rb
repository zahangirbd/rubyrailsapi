module Api
  module V1
    class ArticlesController < ApplicationController

      # GET /articles
      def index
        articles = Article.order('created_at DESC');
        render json: {status: 'SUCCESS', message:'Articles are loaded', data:articles}, status: :ok
      end

      # GET /articles/:id
      def show
        article = Article.find(params[:id]);
        render json: {status: 'SUCCESS', message:'Article is loaded', data:article}, status: :ok
      end

      # POST /articles
      def create
        article = Article.new(article_params);
        if article.save
          render json: {status: 'SUCCESS', message:'Article is saved', data:article}, status: :ok
        else
          render json: {status: 'ERROR', message:'Article is not saved', data:article.error}, status: :unprocessable_entity
        end
      end

      # PUT /articles/:id
      def update
        article = Article.find(params[:id]);
        if article.update_attributes(article_params)
          render json: {status: 'SUCCESS', message:'Article is updated', data:article}, status: :ok
        else
          render json: {status: 'ERROR', message:'Article is not updated', data:article.error}, status: :unprocessable_entity
        end
      end

      # DELETE /articles/:id
      def destroy
        article = Article.find(params[:id]);
        article.destroy
        render json: {status: 'SUCCESS', message:'Article is deleted', data:article}, status: :ok
      end

      private

      def article_params
        params.permit(:title, :body)
      end

    end
  end
end
