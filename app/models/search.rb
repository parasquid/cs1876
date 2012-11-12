# simple search object that conforms to active record so we can easily use
# it with Rails helpers like form_for
# I've added a few helper methods here to help me with debugging (debugging code
# has already been removed)
# I should probably extract this pattern out to a gem (or perhaps a gem already
# exists) but this will suffice for now. Will refactor if I encounter another
# situation like this
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

  def min_beds
    @min_beds ||= 0
  end

  def max_beds
    @max_beds ||= MAX_BEDS
  end

  def min_bathrooms
    @min_bathrooms ||= 0
  end

  def max_bathrooms
    @max_bathrooms ||= MAX_BATHROOMS
  end

  def min_car_spaces
    @min_car_spaces ||= 0
  end

  def max_car_spaces
    @max_car_spaces ||= MAX_CAR_SPACES
  end

end
