class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy
  accepts_nested_attributes_for :items

  TRANSPORT_COST = {
    band_a: 0.45,
    band_b: 0.3,
    band_c: 0.25,
    band_d: 0.15
  }

  def cost_transport
    volume = calculate_volume

    volume * price_per_kg(volume)
  end

  def cost_total
    items_cost = get_items.inject(0){ |sum, item| sum += item.cost}
    items_cost + cost_transport
  end

  private 

  def price_per_kg(volume)
    case volume
    when 1..1999
      TRANSPORT_COST[:band_a]
    when 2000..4999
      TRANSPORT_COST[:band_b]
    when 5000..19999
      TRANSPORT_COST[:band_c]
    when 20000..Float::INFINITY
      TRANSPORT_COST[:band_d]
    end
  end

  def get_items
    self.items.all
  end

  def calculate_volume
    get_items.inject(0){ |sum,item| sum += item.volume}
  end
end
