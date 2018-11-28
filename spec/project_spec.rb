require('pry')
require('rspec')
require('project')

describe("Item")do
  describe(".all")do
    it("ensures that the list is empty in the beginning")do
      expect(Item.all()).to(eq([]))
    end
  end
  describe(".add")do
    it("saves items to list")do
    first_item = Item.new("bunnies", 1)
    first_item.add(first_item.name, first_item.rank)
    expect(Item.all()).to(eq([["bunnies", 1, 0]]))
    end
  end
  # describe(".add")do
  #   it("saves ranks to the list")do
  #   item = Item.new("bunnies", 1)
  #   expect(item.rank).to(eq(1))
  #   end
  # end
  # describe(".add")do
  #   it("saves ranks to the list")do
  #   item = Item.new("bunnies", 1)
  #   expect(item.name).to(eq("bunnies"))
  #   end
  # end
  describe(".add")do
    it("creates a unique id for each item")do
    first_item = Item.new("dogs", 2)
    first_item.add(first_item.name, first_item.rank)
    expect(Item.all()).to(eq([["bunnies", 1, 0], ["dogs", 2, 1]]))
    end
  end

end
