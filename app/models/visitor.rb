class Visitor < ActiveRecord::Base
  class << self
    def check_visitor(ip_address,path_info)
      visitor = where(:ip_address => ip_address, :path_info => path_info, :date_visited => Date.today).first
      unless visitor.present? 
        # @visitor = Visitor.new :ip_address => ip_address, :path_info => path_info, :date_visited => Date.today
        # @visitor.save
      end
    end
  end
end
