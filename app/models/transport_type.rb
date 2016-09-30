class TransportType < ActiveRecord::Base
  def self.transport_per_kg(order)
    type = TransportType.where(transport_type: order.transport_type)
                        .where('range_start <= ?', order.total_volume)
                        .max_by(&:range_start)
    type ? type.cost : 0
  end
end
