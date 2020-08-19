class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!

  def after_sign_in_path_for(resource)
    request.env['omniauth.origin'] || root_path
  end

  def cards_needing_practiced
    @cards ||= current_user.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
  end


end
