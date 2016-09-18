class Api::V1::PlayersController < Api::V1::BaseController
  def index
    respond_with Player.all
  end

  def filter
    puts "#{params[:salary].to_i}".colorize(:red)
    # respond_with Player.where(position: params[:position]).where(salary: params[:salary])
    respond_with Player.where("position = ? AND salary >= ?",params[:position],params[:salary])

  end

  def create
    respond_with :api, :v1, Player.upload_player_data(fd_csv: params[:fd_csv], player_set: params[:player_set])
  end

  def destroy
    respond_with PlayerSet.destroy(params[:id])
  end

  # def update
  #   player = Player.find(params["id"])
  #   player.update_attributes(item_params)
  #   respond_with item, json: item
  # end

  private

  def item_params
    params.require(:player).permit(:position,:salary)
  end
end
