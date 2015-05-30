class Brain
  def self.process_pattern(pattern)
    neurons = find_neurons(pattern)
  end
  
  private
  
  def self.find_neurons(pattern)
    neurons = []
    pattern.body.each_char do |char|
      CharacterReceptor.fire_for(char)
    end
  end
end