require 'minitest/autorun'
require_relative 'string_calculator'

class StringCalculatorTest < Minitest::Test
    def test_empty_string_returns_zero
        assert_equal 0, StringCalculator.add("")
    end

    def test_string_has_one_numeric_value
        assert_equal 1, StringCalculator.add("1")
    end

    def test_string_has_multiple_numeric_value
        assert_equal 6, StringCalculator.add("132")
    end

    def test_string_has_newLine_delimeter
        assert_equal 3, StringCalculator.add("\n12")
    end

    def test_string_has_comma_delimeter
        assert_equal 6, StringCalculator.add("1,5")
    end
    
    def test_string_has_forward_and_semicolon_delimeter
        assert_equal 3, StringCalculator.add("//;1;2")
    end

    def test_string_has_all_combined_delimeter
        assert_equal 8, StringCalculator.add("//;1\n;2,5")
    end

    def test_string_has_negative_number
        exception = assert_raises(RuntimeError) { StringCalculator.add("1,-2,3,-4") }
        assert_equal "negative numbers not allowed -2,-4", exception.message
    end
end

