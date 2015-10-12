module LightsHelper

  def alert_state(state)
    case state
    when 'red'
      'alert-danger'
    when 'yellow'
      'alert-warning'
    when 'green'
      'alert-success'
    end
  end

end
