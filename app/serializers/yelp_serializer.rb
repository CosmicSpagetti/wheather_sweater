class YelpSerializer
  include FastJsonapi::ObjectSerializer
  attributes  :id,
              :address,
              :name, 
              :end_city
end