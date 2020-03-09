require_relative '../automated_init'

context "Write" do
  context "Optional Precision Argument" do
    context "Value is given" do
      number_text = Write.(1111, precision: 3)

      test "Serialized number is rounded to given precision" do
        assert(number_text == "1.11e+03")
      end
    end

    context "Value is not given" do
      number_text = Write.(111, precision: 2)

      test "Serialized number is rounded to default precision" do
        assert(number_text == "1.1e+02")
      end
    end
  end
end
