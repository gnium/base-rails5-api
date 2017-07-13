require 'uri'
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
    code = (params[:code].present? && !params[:code].nil?)? params[:code] : SecureRandom.base64(6).delete('/+=')[0, 6]
    params[:code] = code
    if params[:url].present? && !params[:url].nil? && valid_url?(url)
      @url = Url.create!(url: url, code: code)
      json_response(params[:code], :created)
    else
      json_response(url_params, :bad_request)
    end
    
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
    
  end

  def url_params
    # whitelist params
    params.permit(:url, :code)
  end

  def set_url
    @url = Url.find(params[:id])
  end

  def valid_url?(uri)
  uri = URI.parse(uri)
  uri = !uri.host.nil?
  rescue URI::InvalidURIError
    false
  end
  ## custom


end