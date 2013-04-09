class Article < ActiveRecord::Base
  attr_accessible :content, :title, :key
  attr_accessor :key

  validates_presence_of :title
  validates_presence_of :content

  scope :published, -> { where("published_at IS NOT NULL").order("published_at DESC") }

  def published?
    !!published_at
  end

  def snippet
    content.split("\n")[0..2].join("\n")
  end
end
