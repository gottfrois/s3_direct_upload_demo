class Photo < ActiveRecord::Base
  attr_accessible :title, :body, :url
end
