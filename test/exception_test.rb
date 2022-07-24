# frozen_string_literal: true

class ExceptionTest < MrubycTestCase

  description "raise"
  def test_exception_rescued
    v = nil
    begin
      raise
    rescue
      v = :ok_rescue
    end
    assert_equal(:ok_rescue, v)
  end

  def test_exception_rescued_with_message
    v = nil
    begin
      raise "RAISE"
    rescue => e
      v = e.message
    end
    assert_equal("RAISE", v)
  end

  def test_exception_rescued_with_class
    v = nil
    begin
      raise StandardError
    rescue => e
      v = e.message
    end
    assert_equal("StandardError", v)
  end

  def test_exception_ensure
    v = nil
    begin
      raise
    rescue
    ensure
      v = :ok_ensure
    end
    assert_equal(:ok_ensure, v)
  end


  def test_exception_ensure
    bad = true
    begin
      begin
        raise
      ensure
        bad = false
      end
    rescue
    end
    assert(!bad)
  end

  description "assert_raise can simply identify an exception class"
  def name_error_case
    assert_raise(NameError) do
      NoExistClass.new
    end
  end

  description "assert_raise also accepts an instance of an exception class to check its message"
  def argument_error_new_case
    assert_raise(ArgumentError.new("wrong number of arguments (expected 0..1)")) do
      String.new("1", "2")
    end
  end

  description "assert_raise accepts multiple parameters and asserts true in 'OR condition'"
  def asserts_among_multiple_exceptions_case
    assert_raise(NameError, ArgumentError.new("wrong number of arguments (expected 0..1)")) do
      String.new("1", "2")
    end
  end

end
