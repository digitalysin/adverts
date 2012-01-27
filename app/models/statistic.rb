class Statistic < ActiveRecord::Base
  class << self
    def today?
      first.today.today?
    end
    
    def update_advertisements
      Statistic.first.update_attributes :total_ads_for_today => Advertisement.where("created_at > ?",Date.today).count,
        :total_ads_for_yesterday => Advertisement.where("created_at < ?",Date.today).count,
        :total_ads => Advertisement.count,
        :today => Date.today
    end
    
    def update_visitors
      statistic = first
      statistic.total_visited = Visitor.count
      statistic.total_visit_for_today = Visitor.where(:date_visited => Date.today).count
      statistic.save
    end
  end
end
