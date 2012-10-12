class PostsController < InheritedResources::Base
  before_filter :authenticate, except: [:index, :show]
  caches_action :index, :show

  def create
    expire_action :action => :index
    @post = Post.new(params[:post])
    @post.author = current_user
    create!
  end

  def update
    expire_action :action => [:index, :show]
    update!
  end

  def destroy
    expire_action :action => [:index, :show]
    destroy!
  end

end
