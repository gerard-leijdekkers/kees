class CharacterReceptor < ActiveRecord::Base
  
  # every character that is received gets a receptor
  # a receptor remembers which neuron to fire for the character
  # character receptors are a basic sense
  
  ### ASSOCIATIONS:
  
  belongs_to :neuron
  
  ### CLASS METHODS:
  
  def self.fire_for(character)
    receptor = find_by(character: character)
    
    unless receptor
      neuron = Neuron.new
      logger.info "Created new character-receptor neuron for unknown pattern '#{character}'".colorize(:green)
      receptor = create(character: character, neuron: neuron)
    end
    
    receptor.neuron.fire
  end
end