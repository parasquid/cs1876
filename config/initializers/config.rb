APP_CONFIG = YAML.load_file("#{Rails.root}/config/config.yml")[Rails.env]

PROPERTY_TYPES = APP_CONFIG[:property_types]
MAX_BEDS = APP_CONFIG[:max_beds]
MAX_BATHROOMS = APP_CONFIG[:max_bathrooms]
MAX_CAR_SPACES = APP_CONFIG[:max_car_spaces]
MAX_PRICE = APP_CONFIG[:max_price]
