class Neuron < ActiveRecord::Base
  

  has_many :axons, class_name: 'Synaps', foreign_key: :from
  has_many :dendrites, class_name: 'Synaps', foreign_key: :to
  has_many :neurons, through: :axons
  has_one  :character_receptor
  
  def fire
    logger.info "Neuron #{id} is firing".colorize(:green)

    Brain.add_active_neuron self
    
    axons.each do |synaps|
      synaps.signal_forward
    end
    
    dendrites.each do |synaps|
      synaps.signal_backward
    end
    
    self
  end
  
  def to_char
    character_receptor.try(:character)
  end
end
