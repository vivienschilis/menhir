class Blogpost < ActiveRecord::Base
  belongs_to :project
  has_many :blogcoms
end
