class CharacterReceptor
  
  def self.fire_for(character)
    # first neurons have a fixed id to match them to characters
    pattern_id = Pattern.where(body: character).first.id
    Neuron.fire(pattern_id)

  end
end