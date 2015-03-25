class PgController < ApplicationController
  def index
    redirect_to('http://placegant.me')
  end

  def images
    w = params[:w].to_i
    h = params[:h].to_i

    image = MiniMagick::Image.open(random_image)

    dimensions = "#{w}x#{h}"
    image.combine_options do |command|
      command.filter("box")
      command.resize(dimensions + "^^")
      command.gravity("Center")
      command.extent(dimensions)
    end

    send_file(
      image.path,
      :disposition => 'inline',
      :type => 'image/jpeg',
      :x_sendfile => true
    )
  end

  private

  def random_image
    Dir.glob("app/assets/images/source/*.jpg").sample
  end
end
