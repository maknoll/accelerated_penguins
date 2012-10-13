class PostsController < InheritedResources::Base
  before_filter :authenticate, except: [:index, :show]

  def create
    @post = Post.new(params[:post])
    @post.author = current_user
    create!
  end
end
