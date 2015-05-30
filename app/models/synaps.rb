class Synaps < ActiveRecord::Base
  belongs_to :neuron, foreign_key: :to
end