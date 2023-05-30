class LinksController < ApplicationController
  before_action :load_link, only: :show

  def show
    render
  end

  def new
    @link = Link.new
  end

  def create
    @link = Link.new(link_params)

    respond_to do |format|
      if @link.save
        format.html { redirect_to link_url(@link) }
      else
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  private

    def load_link
      @link = Link.find(params[:id])
    end

    def link_params
      params.require(:link).permit(:url, :slug)
    end
end
