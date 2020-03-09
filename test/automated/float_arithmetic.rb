require_relative './automated_init'

context "Float Arithmetic" do
  context "Numbers are not serialized or deserialized" do
    result = 1.1 - 1

    test "Result is imprecise" do
      refute(result == 0.1)
    end
  end

  context "Numbers are serialized and deserialized" do
    num1 = Read.(Write.(1.1))
    num2 = Read.(Write.(1))

    result = num1 - num2

    test "Result is precise" do
      assert(result == 0.1)
    end
  end
end
