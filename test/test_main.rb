require 'minitest/autorun'
require 'thread'

class ConditionVarTest < Minitest::Test

  def main_method

    @thread<< Thread.new do
      @mutex.synchronize do
        @arr.each { |a|
          @value = a
          @cv.broadcast
          @cv.wait(@mutex)
        }
      end
    end

    @thread<< Thread.new do
      @mutex.synchronize do
        while @thread[0].alive?
          @arr_mutex << @value if @value
          @cv.signal if Thread.list.pop==Thread.current
          @cv.wait(@mutex)
        end
      end
    end
    @thread<< Thread.new do
      @mutex.synchronize do
        while @thread[0].alive?
          @arr_mutex << @value if @value
          @cv.signal if Thread.list.pop==Thread.current
          @cv.wait(@mutex)
        end
      end
    end
    @thread<< Thread.new do
      @mutex.synchronize do
        while @thread[0].alive?
          @arr_mutex << @value if @value
          @cv.signal if Thread.list.pop==Thread.current
          @cv.wait(@mutex)
        end
      end
    end
    sleep 0.5

  end

  def setup
    @mutex = Mutex.new
    @cv = ConditionVariable.new
    @arr = [1, 2, 3, 4, 5, 6, 7, 8]
    @thread =[]
    @arr_mutex = []
    @expected_arr = @arr.reduce([]) { |memo, obj| 3.times { memo << obj }; memo }
  end

  def test_1
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end

  def test_2
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end

  def test_3
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
end
