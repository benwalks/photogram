class Notification < ActiveRecord::Base
  belongs_to :user
  belongs_to :subscribed_user, class_name: 'User'
  belongs_to :post

  validates :user_id, :notified_user_id, :post_id, :notice_type, presence: true
end
