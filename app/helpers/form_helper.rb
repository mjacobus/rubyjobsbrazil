module FormHelper
  def options_for_states
    options_for(State)
  end

  def options_for_available_states
    options_for(State.with_open_jobs)
  end

  def options_for_available_cities
    options_for City.with_open_jobs
  end

  def options_for_cities(state_id = nil)
    options_for City.where(state_id: state_id)
  end

  def options_for(scope)
    scope.order(:name).select(:name, :id).map do |row|
      [row.name, row.id]
    end
  end
end
