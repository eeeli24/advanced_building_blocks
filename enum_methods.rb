module Enumerable

  def my_each
    for i in self
      yield(i)
    end
  end

  def my_each_with_index
    for i in (0..self.size-1)
      yield(self[i], i)
    end
  end

  def my_select
    selected = []
    self.my_each {|i| selected << i if yield(i)}
    selected
  end

  def my_all?
    conclusion = true
    self.my_each { |i| conclusion = false if !yield(i)}
    conclusion
  end

  def my_any?
    conclusion = false
    self.my_each {|i| conclusion = true if yield(i)}
    conclusion
  end

  def my_none?
    conclusion = true
    self.my_each {|i| conclusion = false if yield(i)}
    conclusion
  end

  def my_count obj=nil
    elements = []
    if block_given?
      selected = []
      self.my_each {|i| selected << i if yield(i)}
      selected.size
    else
      if obj == nil
        self.size      
      else
        self.my_each {|el| elements << el if el == obj}
        elements.size
      end
    end
  end

  def my_map
    mapped = []
    self.my_each {|i| mapped << yield(i)}
    mapped
  end

  def my_inject init=0
    injected = init
    for i in (0..self.size-2)
      injected = yield(injected,self[i+1])
    end
    injected
  end

end