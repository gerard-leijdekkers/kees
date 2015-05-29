class Neuron < ActiveRecord::Base
  
  has_many :synapses
  
  def self.fire(id)
    self.find_or_create_by_id(id).fire
  end
  
  def fire
    synapses.each do |synaps|
      synaps
    end
  end
end
