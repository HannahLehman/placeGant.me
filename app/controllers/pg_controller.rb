class PgController < ApplicationController
  def index
    redirect_to('http://placegant.me')
  end

  def images
    @w = params[:w].to_i  
    @h = params[:h].to_i

    if @w < 199 || @h < 199
      @size = "150x150"
    elsif @w > 619 || @h > 619
      @size = "800x800"
    else
      until @w % 20 == 0
        @w -= 1
      end
      until @h % 20 == 0
        @h -= 1
      end
        @size = "#{@w}x#{@h}"
    end
  end
end
