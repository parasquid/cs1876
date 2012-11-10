class Property < Ohm::Model
  include Ohm::Callbacks

  attribute :images_string

  collection :keywords, :Keyword

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
    price = all.sort_by(:price).to_a.reject {|e| e.price.to_i < search.min_price.to_i || e.price.to_i > search.max_price.to_i}
    num_beds = self.between(search.min_beds..search.max_beds, :beds)
    num_bathrooms = self.between(search.min_bathrooms..search.max_bathrooms, :bathrooms)
    num_car_spaces = self.between(search.min_car_spaces..search.max_car_spaces, :car_spaces)

    k_words = []
    skeywords = search.keywords.strip.downcase.gsub(/[^a-z0-9 ]+/, '').split
    skeywords.each do |keyword|
      k_words.push Keyword.find(entry: keyword).to_a
    end

    query = property_types.to_a & num_beds.to_a & price.to_a & num_bathrooms.to_a & num_car_spaces.to_a
    if search.keywords.empty?
      query
    else
      query & k_words.to_a.flatten.map {|k| k.property}
    end
  end

  def blowup_keywords
    (address.split + desc_title.split + desc_body.split).flatten.each do |keyword|
      keyword = keyword.to_s.downcase.gsub(/[^a-z]/, '')
      next if keyword.blank?
      Keyword.create(entry: keyword, property_id: self.id)
    end
  end
end
