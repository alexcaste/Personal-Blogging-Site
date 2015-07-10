class Comment < ActiveRecord::Base

  belongs_to :user
  belongs_to :post

  validates :body, :presence => true

  # def comment_email
  #   UserMailer.comment_email(self).deliver
  # end

end
