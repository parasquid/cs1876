class Property < Ohm::Model
  include Ohm::Callbacks

  attribute :images_string
  set :images, :Image
  attribute :keywords_string
  set :keywords, :Keyword

  attribute :type
  attribute :price
  attribute :beds
  attribute :bathrooms
  attribute :car_spaces
  attribute :address
  attribute :desc_title
  attribute :desc_body

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
