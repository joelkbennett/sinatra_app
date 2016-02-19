class Message < ActiveRecord::Base
  validates :content, presence: true, length: { maximum: 140 }
  validates :author, presence: true, length: { maximum: 25 }
  validate :validate_url, if: "!url.empty?"

  def validate_url
    unless url =~ /\A(http|https):\/{2}\w*\.\w*\.\w{2,6}\Z/
      errors.add(:url, "Not a valid URL")
    end
  end
end