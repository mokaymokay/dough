class Pastry
  attr_accessor :name, :price, :description, :category

  def initialize(name, price, description, category)
    @name = name
    @price = price
    @description = description
    @category = category
  end
end

class Cookie < Pastry
  def initialize(name, price, description)
    category = 'cookie'
    super(name, price, description, category)
  end
end

class Cake < Pastry
  def initialize(name, price, description)
    category = 'cake'
    super(name, price, description, category)
  end
end

class Muffin < Pastry
  def initialize(name, price, description)
    category = 'cookie'
    super(name, price, description, category)
  end
end
