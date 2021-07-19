class Bookmark
  @@bookmark_list = []

  # class methods
  def self.all
    @@bookmark_list
  end

  # instance methods
  def initialize
    @@bookmark_list << self
  end
end
