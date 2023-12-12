require_relative "day8"

input = "RL

AAA = (BBB, CCC)
BBB = (DDD, EEE)
CCC = (ZZZ, GGG)
DDD = (DDD, DDD)
EEE = (EEE, EEE)
GGG = (GGG, GGG)
ZZZ = (ZZZ, ZZZ)"

input_loop = "LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)"

describe "day 8" do
  describe "integration" do
    it "returns the number of steps for simple" do
      expect(Day8.part1(input)).to eq 2
    end

    it "returns the number of steps for looping" do
      expect(Day8.part1(input_loop)).to eq 6
    end
  end

  describe "extract_route" do
    it "returns an array of the route" do
      expect(Day8.extract_route(input)).to eq ["R", "L"]
    end
  end

  describe "extract_nodes" do
    it "returns a hash of nodes" do
      expect(Day8.extract_nodes(input)).to eq ({"AAA" => ["BBB", "CCC"], "BBB" => ["DDD", "EEE"], "CCC" => ["ZZZ", "GGG"], "DDD" => ["DDD", "DDD"], "EEE" => ["EEE", "EEE"], "GGG" => ["GGG", "GGG"], "EEE" => ["EEE", "EEE"], "ZZZ" => ["ZZZ", "ZZZ"]})
    end
  end

  describe "next_node" do
    let(:branch_nodes) { ["BBB", "CCC"] }
    it "returns to next node for left" do
      expect(Day8.next_node(branch_nodes, "L")).to eq "BBB"
    end

    it "returns to next node for right" do
      expect(Day8.next_node(branch_nodes, "R")).to eq "CCC"
    end
  end
end
