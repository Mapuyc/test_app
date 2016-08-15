require 'spec_helper'

describe Comment do
  describe 'validations' do
    subject(:comment) { Comment.new }
    before { comment.valid? }

    [:body].each do |attribute|
      it "should validate presence of #{attribute}" do
      	comment.valid?
        expect(post.errors[attribute].size).to be >= 1
        expect(comment.errors.messages[attribute]).to include "can't be blank"
      end
    end
  end
end
