def bubble_sort a

  swap = true
  loop do
    swap = false
    (a.size-1).times do |i|
      if a[i] > a[i+1]
        a[i], a[i+1] = a[i+1], a[i]
        swap = true
      end
    end
    break if !swap
  end
  p a

end

bubble_sort([4,3,78,2,0,2])



def bubble_sort_by a

  swap = true
  loop do
    swap = false
    (a.size-1).times do |i|
      if yield(a[i].length, a[i+1].length) > 0
        a[i], a[i+1] = a[i+1], a[i]
        swap = true
      end      
    end
    break if !swap
  end
  p a

end

bubble_sort_by(['hi','hello','hey']) {|l,r| l - r}