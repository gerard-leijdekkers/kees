class Brain
  def self.process_pattern(pattern)
    neurons = find_neurons(pattern)
  end
  
  private
  
  def find_neurons(pattern)
    neurons = []
    pattern.each_char do |char|
      CharacterReceptor.fire_for(char)
    end
  end
end