class Menu

  def initialize
    @cakes = {}
    @cookies = {}
    @muffins = {}
  end

  def add_cake(id, name, price, description)
    cake = Cake.new(id, name, price, description)
    @cakes[cake.id] = cake
  end

  def add_cookie(id, name, price, description)
    cookie = Cookie.new(id, name, price, description)
    @cookies[cookie.id] = cookie
  end

  def add_muffin(id, name, price, description)
    muffin = Muffin.new(id, name, price, description)
    @muffins[muffin.id] = muffin
  end

  def cakes
    @cakes
  end

  def cookies
    @cookies
  end

  def muffins
    @muffins
  end

end
