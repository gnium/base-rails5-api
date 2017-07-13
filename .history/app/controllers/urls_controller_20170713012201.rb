# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  before_action :set_todo, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Todo.all
    json_response(@urls)
  end

  # POST /urls
  def create
    @todo = Todo.create!(todo_params)
    json_response(@todo, :created)
  end

  # GET /urls/:id
  def show
    json_response(@todo)
  end

  # PUT /urls/:id
  def update
    @todo.update(todo_params)
    head :no_content
  end

  # DELETE /urls/:id
  def destroy
    @todo.destroy
    head :no_content
  end

  private

  def todo_params
    # whitelist params
    params.permit(:url, :code)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  end
end