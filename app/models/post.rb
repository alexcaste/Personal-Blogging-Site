class Post < ActiveRecord::Base

  belongs_to :user
  has_many :comments

  validates :title, :presence => true
  validates :body, :presence => true

  # def post_email
  #   UserMailer.post_email(self).deliver
  # end

  def summarize
    words = body.split(' ')
    summary = []
    if body.length < 200
      body
    else
      index = 0
      until summary.join(' ').length > 200
        summary.push(words[index])
        index += 1
      end
    summary.join(' ') + ' ...'
    end
  end
  
end
