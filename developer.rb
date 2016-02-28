class Developer
  attr_accessor :name, :task_list


  MAX_TASKS = 10
  WORK_DONE = "выполнена задача"

  def initialize(name)
    @name = name
    @task_list = []
  end

  def type
    :developer
  end

  def add_task(task_name)
    if @task_list.count == self.class::MAX_TASKS
      raise("Слишком много работы!") 
    else
      @task_list << task_name
      puts "%s: добавлена задача \"%s\". Всего в списке задач: %i" %
        [@name, task_name, @task_list.count]
    end
  end

  def tasks
    @task_list.map.with_index{|t,i| "#{i+1}. #{t}"}.join("\n")
  end

  def work!
    if @task_list.empty?
       raise("Нечего делать!")
    else
      puts "%s: %s \"%s\". Осталось задач: %i" %
        [@name, self.class::WORK_DONE, @task_list.shift, @task_list.count]
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
