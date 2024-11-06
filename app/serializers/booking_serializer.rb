# app/serializers/booking_serializer.rb
class BookingSerializer < ActiveModel::Serializer
  attributes :id, :name, :phone, :date, :time, :guests, :created_at, :updated_at

  belongs_to :table
end
