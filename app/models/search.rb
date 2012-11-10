class Search
  extend ActiveModel::Naming
  include ActiveModel::Conversion

  attr_accessor :keywords, :type,
    :min_beds, :max_beds,
    :min_price, :max_price,
    :min_bathrooms, :max_bathrooms,
    :min_car_spaces, :max_car_spaces

  def initialize(attributes = {})
    attributes.each do |name, value|
      send("#{name}=", value)
    end
  end

  def to_model
    self
  end

  def valid?()      true end
  def new_record?() true end
  def destroyed?()  true end

  def errors
    obj = Object.new
    def obj.[](key)         [] end
    def obj.full_messages() [] end
    obj
  end

  def persisted?
    false
  end

  def self.inspect
    "#<#{ self.to_s} #{ self.attributes.collect{ |e| ":#{ e }" }.join(', ') }>"
  end

  def self.attr_accessor(*vars)
    @attributes ||= []
    @attributes.concat( vars )
    super
  end

  def self.attributes
    @attributes
  end

  def min_bathrooms
    @min_bathrooms ||= 0
  end

  def max_bathrooms
    @max_bathrooms ||= 5
  end

  def min_car_spaces
    @min_car_spaces ||= 0
  end

  def max_car_spaces
    @max_car_spaces ||= 5
  end

end
