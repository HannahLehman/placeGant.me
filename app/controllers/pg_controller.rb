class PgController < ApplicationController
  def index
    redirect_to('http://placegant.me')
  end

  def images
    @w = params[:w]
    @h = params[:h]

    if @w.to_i <199 || @h.to_i <199
      @size = "150x150"
    elsif @w.to_i >619 || @h.to_i >619
      @size = "800x800"
    else
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
end