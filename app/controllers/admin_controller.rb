require 'ostruct'
class AdminController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  def seed
    1.upto 5 do
      property = {}
      property['type'] = PROPERTY_TYPES.sample
      property['price'] = rand(5..1000) * 10000
      property['beds'] = rand(1..5)
      property['bathrooms'] = rand(1..5)
      property['car_spaces'] = rand(1..5)
      property['address'] = "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::AddressUS.state}, #{Faker::AddressUS.zip_code}"
      property['desc_title'] = short_text
      property['desc_body'] = long_text
      property['keywords_string'] = short_text.split(' ').join(',').squeeze
      property['images_string'] = three_images(property['type'])
      Property.new(property).save
    end
    redirect_to admin_path, notice: 'Generated 5 random properties'
  end

  private

  def long_text
    FILLER_TEXT.sample
  end

  def short_text
    word_wrap(FILLER_TEXT.sample, 40).split("\n").first
  end

  def three_images(type)
    suckr = ImageSuckr::GoogleSuckr.new(rsz: 30)
    "#{suckr.get_image_url({'q' => type})},#{suckr.get_image_url({'q' => type})},#{suckr.get_image_url({'q' => type})}"
  end

end
