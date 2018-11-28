require('pry')
require('rspec')
require('project')

describe("Item")do
  before() do
    Item.clear()
  end

  describe(".all")do
    it("ensures that the list is empty in the beginning")do
      expect(Item.all()).to(eq([]))
    end
  end
  describe("#add")do
    it("saves items to list")do
    first_item = Item.new("bunnies", 1)
    first_item.add(first_item.name, first_item.rank)
    expect(Item.all()).to(eq([["bunnies", 1, 0]]))
    end
  end
  describe("#add")do
    it("allows us to access the rank of each item")do
    item = Item.new("bunnies", 1)
    expect(item.rank).to(eq(1))
    end
  end
  describe("#add")do
    it("allows us to access the name of each item")do
    item = Item.new("bunnies", 1)
    expect(item.name).to(eq("bunnies"))
    end
  end
  describe("#add")do
    it("allows us to access the id of each item")do
    item = Item.new("bunnies", 1)
    expect(item.id).to(eq(0))
    end
  end
  describe("#add")do
    it("creates a unique id for each item")do
    first_item = Item.new("bunnies", 1)
    first_item.add(first_item.name, first_item.rank)
    second_item = Item.new("dogs", 2)
    second_item.add(second_item.name, second_item.rank)
    expect(Item.all()).to(eq([["bunnies", 1, 0], ["dogs", 2, 1]]))
    end
  end
  describe(".find")do
    it("finds an item based off of the unique ID")do
    first_item = Item.new("bunnies", 1)
    first_item.add(first_item.name, first_item.rank)
    expect(Item.find(0)).to(eq(["bunnies", 1, 0]))
    end
  end
  describe(".delete")do
    it("deletes an item based on the ID")do
    first_item = Item.new("bunnies", 1)
    first_item.add(first_item.name, first_item.rank)
    second_item = Item.new("dogs", 2)
    second_item.add(second_item.name, second_item.rank)
    expect(Item.delete(0)).to(eq([["dogs", 2, 1]]))
    end
  end
  describe(".sort_by_rank")do
    it("sorts items based on the rank")do
    first_item = Item.new("bunnies", 5)
    first_item.add(first_item.name, first_item.rank)
    second_item = Item.new("dogs", 2)
    second_item.add(second_item.name, second_item.rank)
    expect(Item.sort_by_rank).to(eq([["dogs", 2, 1], ["bunnies", 5, 0]]))
    end
  end
  describe(".sort_by_id")do
    it("sorts items based on ID")do
    first_item = Item.new("bunnies", 5)
    first_item.add(first_item.name, first_item.rank)
    second_item = Item.new("dogs", 2)
    second_item.add(second_item.name, second_item.rank)
    expect(Item.sort_by_id).to(eq([["bunnies", 5, 0], ["dogs", 2, 1]]))
    end
  end
  describe(".exist?")do
    it("returns true if an item already exists")do
    first_item = Item.new("bunnies", 5)
    first_item.add(first_item.name, first_item.rank)
    expect(Item.exist?("bunnies")).to(eq(true))
    end
  end
  describe("#update")do
    it("updates an item's name and rank based on user input")do
    first_item = Item.new("bunnies", 5)
    first_item.add(first_item.name, first_item.rank)
    Item.update("frog", 4, 0)
    expect(Item.all()).to(eq([["frog", 4, 0]]))
    end
  end

end
