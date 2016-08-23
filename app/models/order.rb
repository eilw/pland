# The order that each customer can create with has individual items
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  def total_volume
    all_items.inject(0) { |a, e| a + e.volume }
  end

  def transport_per_kg
    type = TransportType.where(transport_type: self.transport_type)
                        .where('range_start <= ?', total_volume)
                        .max_by(&:range_start)
    type ? type.cost : 0
  end

  def cost_transport
    transport_per_kg * total_volume
  end

  def cost_total
    items_cost = all_items.inject(0) { |a, e| a + e.cost }
    items_cost + cost_transport
  end

  def select_transport(type)
    self.transport_type = TransportType.where(transport_type: type)
                                       .where('range_start <= ?', total_volume)
                                       .max_by(&:range_start)
  end

  private

  def all_items
    items.all
  end
end
