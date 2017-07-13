# app/controllers/urls_controller.rb
class UrlsController < ApplicationController
  before_action :set_url, only: [:show, :update, :destroy]

  # GET /urls
  def index
    @urls = Url.all
    json_response(@urls)
  end

  # POST /urls
  def create
    url = params[:url]
    code = SecureRandom.base64(6).delete('/+=')[0, 6] unless params[:url].nil?

    status = check_params(url)
    @url = Url.create!(url: url, code: code)
    json_response(code, status)
  end

  # GET /urls/:id
  def show
    json_response(@url)
  end

  # PUT /urls/:id
  def update
    @url.update(url_params)
    head :no_content
  end

  # DELETE /urls/:id
  def destroy
    @url.destroy
    head :no_content
  end

  def show_by_code
    @url = Url.find_by_code(params[:code])
    Url.increment_counter(:views_count, @url.id)
    json_response(@url) 
  end

  private

  def check_params(url)
    if url.nil? 
      return :bad_request
    else
      return :created
    end
  end

  def url_params
    # whitelist params
    params.permit(:url, :code)
  end

  def set_url
    @url = Url.find(params[:id])
  end

  ## custom


end