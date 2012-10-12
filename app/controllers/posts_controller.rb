class PostsController < InheritedResources::Base
before_filter :authenticate, except: [:index, :show]
end
