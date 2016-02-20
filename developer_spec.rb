require_relative 'it_company'
require 'rspec'

describe Developer do
  let(:name) { 'Вася' }
  let(:max_amount_of_tasks) { 10 }
  let(:task_name) { 'Полить кактус' }
  let(:developer) { Developer.new(name) }

  def add_tasks(amount, tsk_name = task_name)
    amount.times { developer.add_task(tsk_name) }
  end

  describe '#add_task' do
    it 'adds new task correctly' do
      expected_output = "#{name}: добавлена задача "\
        "\"#{task_name}\". Всего в списке задач: 1\n"
      expect { add_tasks(1) }.
        to output(expected_output).to_stdout
    end

    it 'raises error in case there are more than 10 tasks added' do
      add_tasks(max_amount_of_tasks)
      expect { developer.add_task(task_name) }.
        to raise_error('Слишком много работы!')
    end
  end

  describe '#tasks' do
    let(:another_task_name) { 'Go out' }

    it 'shows list of tasks' do
      add_tasks(1)
      add_tasks(1, another_task_name)
      expect { developer.tasks }.to output("1. #{task_name}\n2. #{another_task_name}\n").to_stdout
    end
  end

  describe '#work!' do
    let(:tasks_amount) { max_amount_of_tasks }
    let(:expected_output) { "#{name}: выполнена задача \"#{task_name}\". Осталось задач: %s\n" }

    context 'when there are some tasks' do
      before(:each) { add_tasks(tasks_amount) }

      it 'displays status of working' do
        expect { developer.work! }.
          to output(expected_output % (tasks_amount - 1)).to_stdout
      end

      it 'reduces amount of tasks' do
        (tasks_amount - 1).downto(1) do |index|
          expect { developer.work! }.to output(expected_output % index).to_stdout
        end
      end
    end

    it 'raises error in case there are no tasks' do
      expect { developer.work! }.to raise_error('Нечего делать!')
    end
  end

  describe '#status' do
    it 'says it is free in case no tasks' do
      expect(developer.status).to eq("свободен")
    end

    it 'says it is working in case it has some tasks' do
      add_tasks(max_amount_of_tasks - 1)
      expect(developer.status).to eq("работаю")
    end

    it 'says is is busy in case tasks exceed the limit' do
      add_tasks(max_amount_of_tasks)
      expect(developer.status).to eq("занят")
    end
  end

  describe '#can_add_task?' do
    it 'returns true if tasks are less than limit' do
      add_tasks(1)
      expect(developer.can_add_task?).to be_truthy
    end

    it 'returns false if tasks exceed the limit' do
      add_tasks(max_amount_of_tasks)
      expect(developer.can_add_task?).to be_falsey
    end
  end

  describe '#can_work?' do
    it 'returns true if there are some tasks' do
      add_tasks(max_amount_of_tasks)
      expect(developer.can_work?).to be_truthy
    end

    it 'returns false if there are no tasks' do
      expect(developer.can_work?).to be_falsey
    end
  end
end
