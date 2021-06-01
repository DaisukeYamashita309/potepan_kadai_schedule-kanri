class PostsController < ApplicationController
  def index
    @posts = Post.all
  end
  
  def new
    @posts = Post.new
  end
 
      def create
        @posts = Post.new(params.require(:post).permit(:title,:begin_day,:finish_day,:all_day,:schejule_memo))
    if @posts.valid?(:step1) && @posts.save
      flash[:notice] = "ユーザーを新規登録しました"
      redirect_to :posts
    else
      render "new"
    end
      end
 
      def show
        @post = Post.find(params[:id])
      end
 
      def edit
        @posts = Post.find(params[:id])
      end
 
      def update
        @posts = Post.find(params[:id])
    if @posts.update(params.require(:post).permit(:title,:begin_day,:finish_day,:all_day,:schejule_memo))
      flash[:notice] = "ユーザーIDが「#{@posts.id}」の情報を更新しました"
      redirect_to:posts
    else
      render "edit"
    end
      end
 
      def destroy
        @post = Post.find(params[:id])
    @post.destroy
    flash[:notice]="ユーザーを削除しました"
    redirect_to :posts
      end
end

