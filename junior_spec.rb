require_relative 'it_company'
require 'rspec'

describe JuniorDeveloper do
  let(:name) { 'Вася' }
  let(:max_amount_of_tasks) { 5 }
  let(:task_name) { 'Полить кактус' }
  let(:developer) { JuniorDeveloper.new(name) }

  def add_tasks(amount, tsk_name = task_name)
    amount.times { developer.add_task(tsk_name) }
  end

  it 'accepts maximum of 5 tasks' do
    expect { add_tasks(max_amount_of_tasks) }.to_not raise_error
    expect { add_tasks(max_amount_of_tasks + 1) }.to raise_error
  end

  describe '#work!' do
    let(:expected_output) { "#{name}: пытаюсь делать задачу \"#{task_name}\". Осталось задач: %s\n" }

    it 'tells that he is trying to do task' do
      add_tasks(1)
      expect { developer.work! }.to output(expected_output % 0).to_stdout
    end
  end

  describe '#add_task' do
    it 'accepts task if its length is <= 20' do
      expect { add_tasks(1, 'Small task') }.to_not raise_error
    end

    it 'declines task if its length is > 20' do
      expect { add_tasks(1, task_name * 20) }.to raise_error('Слишком сложно!')
    end
  end
end
