class Training < ApplicationRecord

  @@practice_interval_steps = [0,1,7,16,35,70]

  def self.practice_interval_steps
    @@practice_interval_steps
  end
end
