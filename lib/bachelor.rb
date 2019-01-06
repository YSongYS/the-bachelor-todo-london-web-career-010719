def get_first_name_of_season_winner(data, season)
  data[season.to_sym].each do |contestant|
    if contestant.has_value?("Winner")
      return contestant[:"name"].split(" ")[0]
    end
  end
end

def get_contestant_name(data, occupation)
  data.each do |season_name,season_people|
    season_people.each do |contestant|
      if contestant.has_value?(occupation)
        return contestant[:"name"]
      end
    end
  end
end

def count_contestants_by_hometown(data, hometown)
  counter = 0
  data.each do |season_name,season_people|
    season_people.each do |contestant|
      if contestant.has_value?(hometown)
        counter += 1
      end
    end
  end
  counter
end

def get_occupation(data, hometown)
  data.each do |season_name,season_people|
    season_people.each do |contestant|
      if contestant.has_value?(hometown)
        return contestant[:"occupation"]
      end
    end
  end
end

def get_average_age_for_season(data, season)
  total_age = 0
  number_of_people = 0
  data[season.to_sym].each do |contestant|
    total_age += contestant[:"age"].to_f
    number_of_people += 1
  end
  return (total_age/number_of_people).round
end
