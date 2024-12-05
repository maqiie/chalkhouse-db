# app/models/match.rb
class Match < ApplicationRecord
    has_many :seats
    validates :home_team, :away_team, :utc_date, presence: true
  end
  