class Post < ActiveRecord::Base
  attr_accessible :content, :name, :title, :email
end
