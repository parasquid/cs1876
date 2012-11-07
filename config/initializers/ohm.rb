require 'active_model'

module Ohm
  class Model
    extend ActiveModel::Naming
    include ActiveModel::Conversion

    def persisted?
      !self.new?
    end

  end
end