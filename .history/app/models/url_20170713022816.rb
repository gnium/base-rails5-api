class Url < ActiveRecord::Base
    before_save :default_vote_count

    validates_presence_of :url, :code
end
