class Neuron < ActiveRecord::Base
  

  has_many :axons, class_name: 'Synaps', foreign_key: :from
  has_many :dendrites, class_name: 'Synaps', foreign_key: :to
  has_many :neurons, through: :axons
  
  def fire
    logger.info "Neuron #{id} is firing".colorize(:green)
    axons.each do |synaps|
      synaps.signal_forward
    end
    
    dendrites.each do |synaps|
      synaps.signal_backward
    end
  end
end
