class Neuron < ActiveRecord::Base
  

  has_many :axons, class: :synaps, foreign_key: :from
  has_many :dendrites, class: :synaps, foreign_key: :to
  has_many :neurons, through: :axons
  
  def self.fire(id)
    neuron = Neuron.find_by_id(id)
    unless neuron
      neuron = Neuron.create(id: id)
      logger.info "Created new neuron #{id} for unknown pattern".colorize(:green)
    end
      
    neuron.fire
  end
  
  def fire
    logger.info "Neuron #{id} is firing".colorize(:green)
    neurons.each do |neuron|
      neuron.fire
    end
  end
end
