module PropertiesHelper
  def prices
    (50000..1000000).step(50000).to_a + (1250000..2000000).step(250000).to_a + [2500000, 3000000, 4000000, 5000000, 10000000]
  end
end
