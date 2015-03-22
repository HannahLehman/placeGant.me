class PgController < ApplicationController
  def index
    redirect_to('http://placegant.me')
  end

  def images
    @w = params[:w]
    @h = params[:h]

    until @w.to_i % 20 == 0
      @w = @w.to_i - 1
    end

    until @h.to_i % 20 == 0
      @h = @h.to_i - 1
    end

    width = @w
    height = @h
    @size = width.to_s + 'x' + height.to_s

  end
end

# What happens if it's smaller than 200 and larger than 600?