class Pastry
  attr_accessor :id, :name, :price, :description, :category

  def initialize(id, name, price, description, category)
    @id = id
    @name = name
    @price = price
    @description = description
    @category = category
  end
end

class Cookie < Pastry
  def initialize(id, name, price, description)
    category = 'cookie'
    super(id, name, price, description, category)
  end
end

class Cake < Pastry

  def initialize(id, name, price, description)
    category = 'cake'
    super(id, name, price, description, category)
  end
end

class Muffin < Pastry
  def initialize(id, name, price, description)
    category = 'cookie'
    super(id, name, price, description, category)
  end
end