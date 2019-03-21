class PostsController < ApplicationController
  before_action :set_post, only: %i[show edit update destroy]
  def index
    @posts = Post.all
    @post = Post.new
  end

  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      if @post.save
        format.js #borramos la linea html que tenia aca 
      else
        format.html { render :new } #borramos la liena js que tenia aca
      end
    end
  end

  def show
    respond_to do |format|
      format.js
    end
  end 

  def edit
    respond_to do |format|
      format.js
    end
  end 

  def update
    respond_to do |format|
      if @post.update(post_params)
        format.js
      else
        format.html { redirect_to post_path, alert: 'Error al actualizar' }
      end
    end
  end

  def destroy
    @post.destroy
    respond_to do |format|
      format.js
    end
  end 

end

private

def set_post
  @post = Post.find(params[:id])
end

def post_params
  params.require(:post).permit(:title, :content)
end 