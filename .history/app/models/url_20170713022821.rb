class Url < ActiveRecord::Base
    before_save :default_view_count

    validates_presence_of :url, :code
end
