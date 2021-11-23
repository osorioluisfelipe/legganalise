class TrelloController < ApplicationController
  require 'rest-client'
  require 'json'
  require 'open-uri'
  before_action :set_request

  def new_card
    if current_user.tecnician
      card_name = "#{@request.my_unique_id} - #{@request.user.first_name} #{@request.user.last_name} - entrada #{Date.today.to_s(:long)}"
      RestClient.post "https://api.trello.com/1/cards?name=#{card_name}&idList=60f98388864f8e839ed71b99&key=#{ENV['PUBLIC_TRELLO_KEY']}&token=#{ENV['MEMBER_TRELLO_TOKEN']}", { accept: :json }
      new_checklist
      add_item
      redirect_to requests_path, notice: "Cartão e Checklist criados no trello"
    end
  end

  private
  
  def new_checklist
    card_url = "https://api.trello.com/1/lists/60f98388864f8e839ed71b99/cards?&key=#{ENV['PUBLIC_TRELLO_KEY']}&token=#{ENV['MEMBER_TRELLO_TOKEN']}"
    @last_card_id = JSON.parse(URI.open(card_url).read).last["id"]
    RestClient.post "https://api.trello.com/1/checklists?idCard=#{@last_card_id}&name=Amostras&key=#{ENV['PUBLIC_TRELLO_KEY']}&token=#{ENV['MEMBER_TRELLO_TOKEN']}", { accept: :json }
  end

  def add_item
    checklists_url = "https://api.trello.com/1/cards/#{@last_card_id}/checklists?&key=#{ENV['PUBLIC_TRELLO_KEY']}&token=#{ENV['MEMBER_TRELLO_TOKEN']}"
    checklist_id = JSON.parse(URI.open(checklists_url).read).first["id"]
    @request.samples.each do |sample|
      name = sample.sample_name
      RestClient.post "https://api.trello.com/1/checklists/#{checklist_id}/checkItems?name=#{name}&key=#{ENV['PUBLIC_TRELLO_KEY']}&token=#{ENV['MEMBER_TRELLO_TOKEN']}", { accept: :json }
    end
  end

  def set_request
    @request = Request.find(params[:id])
  end
end
