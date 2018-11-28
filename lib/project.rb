class Item

  @@list = []
  @@counter = 0

  attr_accessor (:name)
  attr_accessor (:rank)

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@counter
  end

  def self.all
  @@list
  end

  def add(name, rank)

    @@counter += 1
    @@list.push([name, rank, @id])
  end
end
