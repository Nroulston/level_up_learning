class Training < ApplicationRecord

  @@card_advancement_steps = [0,1,7,16,35,70]

  def self.card_advancement_steps
    @@card_advancement_steps
  end
end
