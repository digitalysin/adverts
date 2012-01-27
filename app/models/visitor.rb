class Visitor < ActiveRecord::Base
  class << self
    def check_visitor(ip_address,path_info)
      visitor = where(:ip_address => ip_address, :path_info => path_info, :date_visited => Date.today).first
      Visitor.create :ip_address => ip_address, :path_info => path_info, :date_visited => Date.today unless visitor.present? 
    end
  end
end
