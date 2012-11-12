require 'ostruct'
class AdminController < ApplicationController
  include ActionView::Helpers::TextHelper

  def index
  end

  # quick and dirty seeding mechanism - because I don't like typing too much :P
  def seed
    1.upto 20 do
      property = {}
      property['type'] = PROPERTY_TYPES.sample
      property['price'] = rand(5..1000) * (MAX_PRICE / 10000)
      property['beds'] = rand(0..MAX_BEDS)
      property['bathrooms'] = rand(0..MAX_BATHROOMS)
      property['car_spaces'] = rand(0..MAX_CAR_SPACES)
      property['address'] = "#{Faker::Address.street_address}, #{Faker::Address.city} #{Faker::AddressUS.state}, #{Faker::AddressUS.zip_code}"
      property['desc_title'] = short_text
      property['desc_body'] = long_text
      property['images_string'] = three_images(property['type'])
      Property.new(property).save.blowup_keywords
      sleep 1
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

  # searches google images using the property type - see the gem I forked for
  # more yummy details https://github.com/parasquid/image_suckr
  def three_images(type)
    suckr = ImageSuckr::GoogleSuckr.new(safe: 'off', start: rand(0..4), imgtype: 'photo', userip: request.remote_ip)
    images = []
    1.upto 3 do
      images << suckr.get_image_url({'q' => "#{type}"})
    end
    images.uniq.join(',')
  end

end
