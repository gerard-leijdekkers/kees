class Synaps < ActiveRecord::Base
  belongs_to :forward_neurons, foreign_key: :to
  belongs_to :backward_neurons, foreign_key: :from
  
  def signal_forward
    forward_neurons.each do |neuron|
      neuron.fire
    end
  end
  
  def signal_backward
    backward_neurons.each do |neuron|
      neuron.fire
    end
  end
end