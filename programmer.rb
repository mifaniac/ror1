class Programmer

	attr_reader :skill,
				      :rationality,
				      :fatigue,
              :manager,
              :order

  def initialize(options)
    @skill = options[:skill]
    @rationality = options[:rationality]
    @fatigue   = options[:fatigue]
    @order = options[:order]
  end

end
