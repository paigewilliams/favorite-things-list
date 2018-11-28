class Item

  @@list = []
  @@counter = 0

  attr_accessor (:name)
  attr_accessor (:rank)
  attr_accessor (:id)

  def initialize(name, rank)
    @name = name
    @rank = rank
    @id = @@counter
  end

  def add(name, rank)
    @@counter += 1
    @@list.push([name, rank, @id])
  end

  def self.all
    @@list
  end

  def self.clear()
    @@list = []
    @@counter = 0
  end

  def self.find(id)
    @@list.each do |item|
      if item[2] == id
        return item
      end
    end
  end

  def self.delete(id)
    @@list = @@list.delete_if {|item| item[2]==id}
  end

  def self.sort_by_rank
    @@list.sort_by! {|item| item[1] }
  end

  def self.sort_by_id
    @@list.sort_by! {|item| item[2] }
  end

  def self.exist?(name)
    @@list.each do |item|
      if item[0] == name
        return true
      else
        return false
      end
    end
  end

end
