require_relative "developer"

class SeniorDeveloper < Developer
  
  MAX_TASKS = 15

  def work!
    if @task_list.length < 2
      [true, false].sample ? super : puts("Что-то лень")
      good_mood = [true, false].sample
    else
      [true, false].sample ? 2.times { super } : puts("Что-то лень")
      good_mood = [true, false].sample
    end
  end

  def type
    :senior
  end

end

