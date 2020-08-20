class User < ApplicationRecord
  serialize :cards_needing_practice
  has_many :memory_decks
  has_many :memory_cards, through: :memory_decks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :validatable, :trackable, :omniauthable, :omniauth_providers => [:github] 

  def self.from_omniauth(auth)  
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]
    end
  end

  def cards_for_practice?
    @cards.present?
  end

  def cards_to_practice
    self.cards_needing_practice ||= self.memory_cards.joins(:deck_card_records).where("deck_card_records.practice_date <= 'Time.now'")
    self.save
  end
  
  def card_to_practice
    if cards_for_practice?
      @card ||= self.cards_needing_practice.first

    end
  end
end
