
class Brain

  MAX_SIMULTANIOUSLY_ACTIVE_NEURONS = 7

  # pattern input
  def self.process_pattern(pattern)
    neurons = fire_receptors(pattern)
  end
  
  def self.add_active_neuron(neuron)
    $active_neurons ||= []
    
    $active_neurons.push neuron
    $active_neurons.shift if $active_neurons.size > MAX_SIMULTANIOUSLY_ACTIVE_NEURONS
  end
  
  def self.active_neurons
    $active_neurons ||= []
    
    $active_neurons.map { |n| n.to_char }
  end
  
  private
  
  def self.fire_receptors(pattern)
    pattern.body.each_char do |char|
      CharacterReceptor.fire_for(char)
    end
  end
end
