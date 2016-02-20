class Developer
  attr_accessor :dev_name
  MAX_TASKS = 10
  WORK_DONE = "выполнена задача"

  def initialize(dev_name)
    @dev_name = dev_name
    @task_list = []
  end

  def add_task(task_name)
    if @task_list.count == self.class::MAX_TASKS
      raise("Слишком много работы!") 
    else
      @task_list << task_name
      puts "%s: добавлена задача \"%s\". Всего в списке задач: %i" %
        [@dev_name, task_name, @task_list.count]
    end
  end

  def tasks
    @task_list.each_with_index {|task, index| puts "#{index+1}. #{task}"}
  end

  def work!
    if @task_list.empty?
       raise("Нечего делать!")
    else
      puts "%s: %s \"%s\". Осталось задач: %i" %
        [@dev_name, self.class::WORK_DONE, @task_list.shift, @task_list.count]
    end
  end

  def can_add_task?
    @task_list.count < self.class::MAX_TASKS ? true : false
  end

  def can_work?
    @task_list.count > 0 ? true : false
  end

    def status
    case 
      when !can_add_task?
        "занят" 
      when can_work?
        "работаю" 
      else
        "свободен"  
    end
  end

end

#------------------------------------------------------------------------------

class JuniorDeveloper < Developer
  attr_accessor :dev_name

  MAX_TASKS = 5
  WORK_DONE = "пытаюсь делать задачу"
  COMPLEXITY = 20

  def add_task(task_name)
    raise("Слишком сложно!") if task_name.length > COMPLEXITY
    super
  end
end

#------------------------------------------------------------------------------

class SeniorDeveloper < Developer
  
  MAX_TASKS = 15

  def work!
    [true, false].sample ? @task_list.shift(2) : puts("Что-то лень")
#    good_mood = [true, false].sample
#    if good_mood 
#      @task_list.shift(2)
#    else
#      puts "Что-то лень"
#    end
  end
end

