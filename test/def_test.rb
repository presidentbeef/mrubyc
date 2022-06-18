# frozen_string_literal: true

class DefTest < MrubycTestCase
  description "OP_DEF should return the symbol of the method name"
  METHOD_NAME_SYM = def op_def_return
    assert_equal(:op_def_return, METHOD_NAME_SYM)
  end
end
