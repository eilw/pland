# The order that each customer can create with has individual items
class Order < ActiveRecord::Base
  belongs_to :user
  has_many :items, dependent: :destroy

  MINIMUM_WEIGHT = 1000

  def total_volume
    all_items.map(&:volume).inject(0, &:+)
  end

  def transport_per_kg
    transport_type_service.transport_per_kg(self)
  end

  def cost_transport
    transport_per_kg * total_volume
  end

  def cost_total
    cost_of_all_items + cost_transport
  end

  def complete?
    (total_volume >= MINIMUM_WEIGHT && valid_transport_type?)
  end

  private

  def transport_type_service
    TransportType
  end

  def valid_transport_type?
    transport_type_service.find_by(transport_type: transport_type)
  end

  def cost_of_all_items
    all_items.map(&:cost).inject(0, &:+)
  end

  def all_items
    items.all
  end
end
