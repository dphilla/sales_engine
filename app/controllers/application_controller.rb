class ApplicationController < ActionController::API

  def randomize(model)
    model.order("RANDOM()").first
  end

  def format_raw(raw)
    raw = (raw.to_f / 100)
    {"total_revenue": "#{raw}"}
  end

  def format_revenue_raw(raw)
    raw = (raw.to_f / 100)
    {"revenue": "#{raw}"}
  end

end
