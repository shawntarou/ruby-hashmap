require_relative 'hashmap'
require_relative 'linkedlist'

test = HashMap.new

test.set('apple', 'red')
test.set('banana', 'yellow')
test.set('carrot', 'orange')
test.set('dog', 'brown')
test.set('elephant', 'gray')
test.set('frog', 'green')
test.set('grape', 'purple')
test.set('hat', 'black')
test.set('ice cream', 'white')
test.set('jacket', 'blue')
test.set('kite', 'pink')
test.set('lion', 'golden')

test.print_all
puts
test.set('moon', 'silver')
test.set('epicness', 'no color')
test.set('pig', 'pinkey')
test.set('lion', 'striped')
test.set('apple', 'purple')
test.print_all
puts test.length
p test.keys
p test.values
p test.entries
puts test.get('epicness')

