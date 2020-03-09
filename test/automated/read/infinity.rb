require_relative '../automated_init'

context "Read" do
  context "Infinity" do
    context "Positive Infinity" do
      number_text = Controls::Number::Infinity::Positive::Text.example

      number = Read.(number_text)

      test do
        control_number = Controls::Number::Infinity::Positive.example

        assert(number == control_number)
      end
    end

    context "Negative Infinity" do
      number_text = Controls::Number::Infinity::Negative::Text.example

      number = Read.(number_text)

      test do
        control_number = Controls::Number::Infinity::Negative.example

        assert(number == control_number)
      end
    end
  end
end
