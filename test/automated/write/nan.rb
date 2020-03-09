require_relative '../automated_init'

context "Write" do
  context "Not A Number (NaN)" do
    context "BigDecimal" do
      number = Controls::Number::NaN.bigdecimal

      number_text = Write.(number)

      test do
        control_text = Controls::Number::NaN::Text.example

        assert(number_text == control_text)
      end
    end

    context "Float" do
      number = Controls::Number::NaN.float

      number_text = Write.(number)

      test do
        control_text = Controls::Number::NaN::Text.example

        assert(number_text == control_text)
      end
    end
  end
end
