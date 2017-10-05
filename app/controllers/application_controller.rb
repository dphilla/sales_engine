class ApplicationController < ActionController::API

  def randomize(model)
    model.order("RANDOM()").first
  end

end
