class LocationSerializer < ActiveModel::Serializer
  attributes :id, :name, :street, :city, :state,:zip_code,:url, :type, :coordinates
end
