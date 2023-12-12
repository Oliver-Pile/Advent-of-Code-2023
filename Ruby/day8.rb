module Day8

  # This is the entry point, pass it the input via tests or through a function that can read the file.
  def self.part1 input
    route = extract_route(input)
    nodes = extract_nodes(input)

    count = 0
    current_node = "AAA"
    while current_node != "ZZZ" do
      route.each do |direction|
        return count if current_node == "ZZZ"
        
        count += 1
        
        current_node = next_node(nodes[current_node], direction)
      end
    end

    return count
  end

  def self.extract_route input
    input.split("\n").first.split("")
  end

  def self.extract_nodes input
    output = {}
    input.split("\n")[2..].each do |line|
      key = line.split(" = ")[0]
      values = line.split(" = ")[1][1...-1].split(", ")
      output[key] = values
    end
    output
  end

  def self.next_node(branch_nodes, direction)
    if direction == "L"
      branch_nodes[0]
    else
      branch_nodes[1]
    end
  end
end