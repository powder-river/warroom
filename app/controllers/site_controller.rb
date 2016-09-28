class SiteController < ApplicationController
  def index
  end

  def admin
  end

  def create_player_set
    set = PlayerSet.create
    Player.upload_player_data(player_set: set)
    redirect_back(fallback_location: root_path)
  end

  def download_nfl_stats
    Statistics.new.nfl_data
    redirect_back(fallback_location: root_path)
  end
end
