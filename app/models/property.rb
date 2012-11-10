class Property < Ohm::Model
  include Ohm::Callbacks

  attribute :images_string
  set :images, :Image
  attribute :keywords_string
  set :keywords, :Keyword

  attribute :type
  index :type

  attribute :price
  index :price

  attribute :beds
  index :beds

  attribute :bathrooms
  index :bathrooms

  attribute :car_spaces
  index :car_spaces

  attribute :address
  index :address

  attribute :desc_title
  index :desc_title

  attribute :desc_body
  index :desc_body

  def self.between(range, attribute)
    set = self.find(attribute.to_sym => range.first)
    range.each do |i|
      set = set.union(attribute.to_sym => i)
    end
    set
  end

  def self.filter(search)
    return all if search.nil?
    search.type = PROPERTY_TYPES if search.type.include? 'All Property Types'
    property_types = self.between(search.type, :type)
    num_beds = self.between(search.min_beds..search.max_beds, :beds)
    price = all.sort_by(:price).to_a.reject {|e| e.price.to_i < search.min_price.to_i || e.price.to_i > search.max_price.to_i}
    property_types.to_a & num_beds.to_a & price.to_a
  end

  def save
    blowup_images
    blowup_keywords
    super
  end

  def update_attributes(attributes)
    blowup_images
    blowup_keywords
    super(attributes)
  end

  protected

  def blowup_images
    puts 'blowing up images'
  end

  def blowup_keywords
    puts 'blowing up keywords'
  end
end
