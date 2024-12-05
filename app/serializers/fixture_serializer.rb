class FixtureSerializer < ActiveModel::Serializer
  attributes :id, :date, :status, :venue, :home_team, :away_team, :score

  def venue
    object["venue"]["name"]
  end

  def home_team
    {
      name: object["teams"]["home"]["name"],
      logo: object["teams"]["home"]["logo"]
    }
  end

  def away_team
    {
      name: object["teams"]["away"]["name"],
      logo: object["teams"]["away"]["logo"]
    }
  end

  def score
    {
      home: object["goals"]["home"],
      away: object["goals"]["away"]
    }
  end
end
