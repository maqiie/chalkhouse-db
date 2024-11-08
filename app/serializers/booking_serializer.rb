class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :date, :time, :guests, :table_id, :booking_fee, :created_at, :is_table_available

  belongs_to :table

  def is_table_available
    object.table.available?(object.start_time, object.end_time)
  end
end
