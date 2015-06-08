class Brain

  MAX_SIMULTANIOUSLY_ACTIVE_NEURONS = 7

  class << self
  
    # pattern input
    def process_pattern(pattern)
      neurons = fire_receptors(pattern)
    end
  
    def process_activated_neuron(neuron)
      track_activated_neuron(neuron)
      
      fire_together(neuron, previous_activated_neuron) if previous_activated_neuron
    end
    
    # activated neurons tracker
    def track_activated_neuron(neuron)
      $active_neurons ||= []
    
      $active_neurons.push neuron
      $active_neurons.shift if $active_neurons.size > MAX_SIMULTANIOUSLY_ACTIVE_NEURONS
    end
  
    def activated_neurons
      $active_neurons ||= []
    
      $active_neurons.map { |n| n.to_char }
    end
  
    def previous_activated_neuron
      $active_neurons.try(:[], -2)
    end
    
    private
    
    def fire_together(neuron_1, neuron_2)
      logger = Rails.logger
      if synaps = Synaps.where(from: neuron_1, to: neuron_2).first
        synaps.increase_weight
        logger.info "Synaps #{neuron_1.to_char} -> #{neuron_2.to_char} grow".colorize(:yellow)
      else
        synaps = Synaps.create(from: neuron_1, to: neuron_2)
        logger.info "Synaps created #{neuron_1.to_char} -> #{neuron_2.to_char}".colorize(:yellow)
      end
      
    end
  
    def fire_receptors(pattern)
      pattern.body.each_char do |char|
        CharacterReceptor.fire_for(char)
      end
    end
  end
end
