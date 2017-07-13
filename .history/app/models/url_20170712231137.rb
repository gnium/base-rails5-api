class Url < ActiveRecord::Base

    validates_presence_of :url, :code
end
