# Non-db backed model for accessing artwork information
class Artwork
  attr_accessor :name, :filename, :ext, :description

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def id
    filename
  end

  def thumb_path
    "portfolio/art/#{filename}_thumb.#{ext}"
  end

  def image_path
    "portfolio/art/#{filename}.#{ext}"
  end

  def self.find(id)
    all.select { |artwork| artwork.id == id }.first
  end

  def self.all
    @@artworks ||= create_artworks
  end

  def self.create_artworks
    [
      {
        name: "Babel",
        filename: "babel",
        ext: "jpg"
      }, {
        name: "Babel: Floor 143",
        filename: "babel_floor143",
        ext: "jpg"
      }, {
        name: "Babel: Floor 1321",
        filename: "babel_floor1321",
        ext: "jpg"
      }, {
        name: "Self Portrait",
        filename: "self_portrait",
        ext: "jpg"
      }, {
        name: "Shoe",
        filename: "shoe",
        ext: "jpg"
      }, {
        name: "Code Self Portrait",
        filename: "typoportrait",
        ext: "png"
      }, {
        name: "Crumpled",
        filename: "bag",
        ext: "jpg"
      }, {
        name: "Still Life",
        filename: "still_life_charcoal",
        ext: "jpg"
      }, {
        name: "Color Wheel",
        filename: "color_wheel",
        ext: "jpg"
      }, {
        name: "Tree",
        filename: "tree",
        ext: "jpg"
      }
    ].map do |artwork_data|
      Artwork.new(artwork_data)
    end
  end
end