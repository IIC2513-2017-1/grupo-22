module CheckTeam

def search_away_team
  team = Team.find(self.away_team_id)
  if item.nil?
    errors.add(:id_found, "No existe ")
  end
 end

def search_home_team
  team = Team.find(self.home_team_id)
  if item.nil?
    errors.add(:id_found, "No existe")
  end
 end
end