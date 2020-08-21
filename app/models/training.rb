class Training < ApplicationRecord

  @@practice_interval_steps = [0,1,7,16,35,70]

  def self.practice_interval_steps
    @@practice_interval_steps
  end

  def self.advance_card_in_interval_set_or_reset_to_zero(params, current_record, current_user)
    if params[:advance_card]
      
      current_record.practice_interval_counter = Training.practice_interval_steps[Training.practice_interval_steps.index(current_record.practice_interval_counter) + 1]
 
      current_record.practice_date = Time.now.next_day(current_record.practice_interval_counter)
 
      current_user.cards_needing_practice.delete_at(0)
 
      if current_user.cards_needing_practice.blank?
       current_user.cards_needing_practice = nil
      end
    else
      
       current_record.practice_interval_counter = Training.practice_interval_steps[0]
       
       current_user.cards_needing_practice << current_user.cards_needing_practice.shift
    end
    current_user.save
    current_record.save
  end
end
