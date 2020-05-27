class Location < ApplicationRecord

  def coordinates
    {
        lat:lat,
        long:long
    }
  end
end
