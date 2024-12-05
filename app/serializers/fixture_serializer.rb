class FixtureSerializer < ActiveModel::Serializer
  attributes :id, :date, :status, :venue, :home_team, :away_team, :score

  # Extract the venue name
  def venue
    object["venue"] && object["venue"]["name"]
  end

  # Extract home team details
  def home_team
    return {} unless object["teams"] && object["teams"]["home"]

    {
      name: object["teams"]["home"]["name"],
      logo: object["teams"]["home"]["logo"]
    }
  end

  # Extract away team details
  def away_team
    return {} unless object["teams"] && object["teams"]["away"]

    {
      name: object["teams"]["away"]["name"],
      logo: object["teams"]["away"]["logo"]
    }
  end

  # Extract the score details
  def score
    {
      home: object["goals"] ? object["goals"]["home"] : nil,
      away: object["goals"] ? object["goals"]["away"] : nil
    }
  end
end
