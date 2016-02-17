require_relative 'customer'
require_relative 'order'
require_relative 'manager'
require_relative 'programmer'

class ItCompanySimulator
  def self.start
    manager = Manager.new({ communicability: 100, ability_to_organize: 90})
    customer = Customer.new({ requirements: 100, remuneration: 30000,
      competence: 75, adequacy: 63, manager: manager })
    order = Order.new({ customer: customer, manager: manager,
      complexity: 100, clear: 100, deadline: '21.02.2016' })
    programmer = Programmer.new({ skill: 95, rationality: 80,
      fatigue: 10, manager: manager, order: order })
  end

end

ItCompanySimulator.start



		
		