class TrelloController < ApplicationController
  require 'json'
  require 'open-uri'

  api_key = 6336733d2bc258b39f83b0c30d073502
  api_token = 580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20
  id_boletins_recebidos = 60f98388864f8e839ed71b99

  def new_card
    @request = Request.find(params[:id])
    card_name = "#{@request.my_unique_id} - #{@request.user.first_name} #{@request.user.last_name}"
    RestClient.post "https://api.trello.com/1/cards?name=#{card_name}&idList=#{id_boletins_recebidos}&key=#{api_key}&token=#{api_token}"
  end

  def new_checklist
  end

  def add_item
  end
end
