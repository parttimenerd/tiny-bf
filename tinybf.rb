# by Parttimenerd inspired by Fogus tiny Lisp interpreter

class Bf
  def initialize echo_handler, get_handler
    @env = { 
      '+' => lambda { |arr, iarr, _| arr[iarr[0]] = 0 if (arr[iarr[0]] += 1) > 127 },
      '-' => lambda { |arr, iarr, _| arr[iarr[0]] = 127 if (arr[iarr[0]] -= 1) < 0 },
      '.' => lambda { |arr, iarr, _| echo_handler.call(arr[iarr[0]].chr) },
      ',' => lambda { |arr, iarr, _| arr[iarr[0]] = get_handler.call.ord },
      '<' => lambda { |arr, iarr, _| iarr[0] = 0 if (iarr[0] -= 1) < 0 },
      '>' => lambda { |arr, iarr, _| arr[iarr[0]] = 0 unless arr[iarr[0] += 1] },
      '[' => lambda { |arr, iarr, b_stack| b_stack << iarr[1] },
      ']' => lambda { |arr, iarr, b_stack| (arr[iarr[0]] > 0 && iarr[1] = b_stack[-1]) || b_stack.pop }
    }
  end

  def eval bf_expr, ctx=@env, arr = [0], b_stack = [], iarr = [0, -1]
    while (ex = bf_expr[iarr[1] += 1]) && (expr = ctx[ex]) do expr.call(arr, iarr, b_stack) end
    arr
  end
end