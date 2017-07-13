class Url < ActiveRecord::Base
    before_save :default_view_count

    validates_presence_of :url, :code

    def default_vote_count
        self.votes ||= 0
    end
end
