require_relative '../automated_init'

context "Write" do
  context "Infinity" do
    context "Positive Infinity" do
      context "BigDecimal" do
        number = Controls::Number::Infinity::Positive.bigdecimal

        number_text = Write.(number)

        test do
          control_text = Controls::Number::Infinity::Positive::Text.example

          assert(number_text == control_text)
        end
      end

      context "Float" do
        number = Controls::Number::Infinity::Positive.float

        number_text = Write.(number)

        test do
          control_text = Controls::Number::Infinity::Positive::Text.example

          assert(number_text == control_text)
        end
      end
    end

    context "Negative Infinity" do
      context "BigDecimal" do
        number = Controls::Number::Infinity::Negative.bigdecimal

        number_text = Write.(number)

        test do
          control_text = Controls::Number::Infinity::Negative::Text.example

          assert(number_text == control_text)
        end
      end

      context "Float" do
        number = Controls::Number::Infinity::Negative.float

        number_text = Write.(number)

        test do
          control_text = Controls::Number::Infinity::Negative::Text.example

          assert(number_text == control_text)
        end
      end
    end
  end
end
