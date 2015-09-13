require 'minitest/autorun'
require 'thread'

class ConditionVarTest < Minitest::Test

  def main_method

    3.times do |i|
      @thread << Fiber.new do
        while true
          @arr_mutex << @value
          Fiber.yield
        end
      end
    end

    @arr.each do |a|
      @value = a
      @thread.each do |t|
        t.resume
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

  def test_4
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_5
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_6
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_7
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_8
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_9
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
  def test_10
    main_method
    assert_equal(@arr_mutex, @expected_arr)
  end
end
