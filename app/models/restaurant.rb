class Restaurant < ActiveRecord::Base
  has_many :reviews, dependent: :destroy
  validates :name, length: { minimum: 3 }, uniqueness: true
  has_attached_file :image, :default_url => "blank.gif", :styles => { :medium => "300x300>", :thumb => "100x100>" }
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/

  has_attached_file :image, :default_url => "blank.gif", :styles => { :medium => "300x300>", :thumb => "100x100>" },
                    :storage => :s3,
                    :s3_credentials => Proc.new{|a| a.instance.s3_credentials }

  def s3_credentials
    {:bucket => "cjo-yelpclone", :access_key_id => Rails.application.secrets.access_key_id, :secret_access_key => Rails.application.secrets.secret_access_key}
  end

  def average_rating
    return "N/A" if reviews.none?
    reviews.average(:rating)
    # reviews.inject(0) { |memo, review| memo + review.rating } / reviews.count
  end
end
