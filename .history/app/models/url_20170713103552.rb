class Url < ActiveRecord::Base
    before_save :default_view_count
    validates_uniqueness_of :code
    validates_presence_of :url, :code
    validates :url, :format => URI::regexp(/^(https?:\/\/)?([\da-z\.-]+)\.([a-z\.]{2,6})([\/\w \.-]*)*\/?$/)
    def default_view_count
        self.views_count ||= 0
    end
end
