require_relative "developer"

class JuniorDeveloper < Developer
  attr_accessor :name
  attr_reader :task_list


  MAX_TASKS = 5
  WORK_DONE = "пытаюсь делать задачу"
  COMPLEXITY = 20

  def add_task(task_name)
    raise("Слишком сложно!") if task_name.length > COMPLEXITY
    super
  end

  def type
    :junior
  end
   
end
