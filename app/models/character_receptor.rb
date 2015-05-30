class CharacterReceptor
  
  def self.fire_for(character)
    # character receptors are neurons with a fixed id
    pattern_id = Pattern.where(body: character).first.id
    Neuron.fire(pattern_id)
  end
end