require 'ostruct'
class AdminController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  def seed
    1.upto 20 do
      property = {}
      property['type'] = PROPERTY_TYPES.sample
      property['price'] = rand(5..1000) * 10000
      property['beds'] = rand(0..5)
      property['bathrooms'] = rand(0..5)
      property['car_spaces'] = rand(0..5)
      property['address'] = "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::AddressUS.state}, #{Faker::AddressUS.zip_code}"
      property['desc_title'] = short_text
      property['desc_body'] = long_text
      property['images_string'] = three_images(property['type'])
      Property.new(property).save.blowup_keywords
    end
    redirect_to admin_path, notice: 'Generated 20 random properties'
  end

  def clear
    Ohm.flush
    redirect_to admin_path, notice: 'All properties deleted'
  end

  private

  def long_text
    FILLER_TEXT.sample
  end

  def short_text
    word_wrap(FILLER_TEXT.sample, line_width: 40).split("\n").first
  end

  def three_images(type)
    suckr = ImageSuckr::GoogleSuckr.new(safe: 'off', start: rand(0..4), imgtype: 'photo', userip: request.remote_ip)
    images = []
    1.upto 3 do
      images << suckr.get_image_url({'q' => "#{type}"})
    end
    images.uniq.join(',')
  end

end
