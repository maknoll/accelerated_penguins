class Post < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  attr_accessible :abstract, :content, :title
end
