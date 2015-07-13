class Post < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  has_many :comments, dependent: :destroy

  validates :user_id, presence: true
  validates :image, presence: true

  has_attached_file :image, styles: { :medium => "640x" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
end
