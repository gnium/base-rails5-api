# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all
    json_response(@urls)
  end

  # POST /urls
  def create
    @todo = Url.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /urls/:id
  def show
    json_response(@todo)
  end

  # PUT /urls/:id
  def update
    @Url.update(todo_params)
    head :no_content
  end

  # DELETE /urls/:id
  def destroy
    @Url.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:url, :code)
  end

  def set_todo
    @todo = Url.find(params[:id])
  end
end