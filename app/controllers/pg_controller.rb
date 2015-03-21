class PgController < ApplicationController
  def images
    @size = params[:size]
  end
end

