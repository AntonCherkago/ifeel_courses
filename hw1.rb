# frozen string literal: true

class Bucket
  attr_accessor :items
  PRICES = { 'potato' => 25, 'tomato' => 35, 'cucumber' => 30, 'cherry' => 20, 'nuts' => 40 }.freeze

  def initialize
    @items = []
  end

  def add_item(item)
    if PRICES.key?(item)
      @items.push item
      puts 'item successfully added to the bucket'
    else
      puts 'this item can not to be add to the bucket'
    end
  end

  def +(joiner)
    @items.push(*joiner.items)
    joiner.items.clear
    self
  end

  def total_sum
    @items.collect { |value| PRICES[value] }.inject(:+)
  end
end
