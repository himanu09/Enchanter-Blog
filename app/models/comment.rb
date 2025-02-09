# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  body       :text
#  status     :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  article_id :integer          not null
#  user_id    :integer          not null
#
# Indexes
#
#  index_comments_on_article_id  (article_id)
#  index_comments_on_user_id     (user_id)
#
# Foreign Keys
#
#  article_id  (article_id => articles.id)
#  user_id     (user_id => users.id)
#
class Comment < ApplicationRecord
  include Visible

  belongs_to :user
  belongs_to :article
end
