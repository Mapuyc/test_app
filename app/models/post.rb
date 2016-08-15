class Post < ActiveRecord::Base
    has_many :comments, as: :commentable, dependent: :destroy
	belongs_to :user, :foreign_key => 'user_id'
	validates :body, presence: true
end
