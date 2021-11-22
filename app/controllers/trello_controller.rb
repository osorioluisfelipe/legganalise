class TrelloController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'open-uri'
  before_action :set_request

  def new_card
    card_name = "#{@request.my_unique_id} - #{@request.user.first_name} #{@request.user.last_name} - entrada #{Date.today.to_s(:long)}"
    RestClient.post "https://api.trello.com/1/cards?name=#{card_name}&idList=60f98388864f8e839ed71b99&key=6336733d2bc258b39f83b0c30d073502&token=580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20", { accept: :json }
    new_checklist
    add_item
    redirect_to requests_path, notice: "Cartão e Checklist criados no trello"
  end

  private

  # id_lista leitura: 5b71ccca21ee49793086fd02
  # id_lista sala_limpa: 60f98388864f8e839ed71b99
  def new_checklist
    card_url = "https://api.trello.com/1/lists/60f98388864f8e839ed71b99/cards?&key=6336733d2bc258b39f83b0c30d073502&token=580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20"
    @last_card_id = JSON.parse(URI.open(card_url).read).last["id"]
    RestClient.post "https://api.trello.com/1/checklists?idCard=#{@last_card_id}&name=Amostras&key=6336733d2bc258b39f83b0c30d073502&token=580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20", { accept: :json }
  end

  def add_item
    checklists_url = "https://api.trello.com/1/cards/#{@last_card_id}/checklists?&key=6336733d2bc258b39f83b0c30d073502&token=580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20"
    checklist_id = JSON.parse(URI.open(checklists_url).read).first["id"]
    @request.samples.each do |sample|
      name = sample.sample_name
      RestClient.post "https://api.trello.com/1/checklists/#{checklist_id}/checkItems?name=#{name}&key=6336733d2bc258b39f83b0c30d073502&token=580eed21073f7cdb6733f4739080a7f4b62c5e5047b8e313c184ce37feb82a20", { accept: :json }
    end
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
