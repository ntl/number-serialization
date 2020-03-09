require_relative '../../automated_init'

context "Write" do
  context "Rounding" do
    context "Mode Given" do
      previous_rounding_mode = BigDecimal.mode(BigDecimal::ROUND_MODE)

      rounding_mode = BigDecimal::ROUND_UP

      refute(rounding_mode == previous_rounding_mode)

      number_text = Write.(1111, precision: 3, rounding_mode: rounding_mode)

      test "Given rounding mode is used" do
        assert(number_text == '1.12e+03')
      end

      test "Previous rounding mode is restored" do
        current_rounding_mode = BigDecimal.mode(BigDecimal::ROUND_MODE)

        assert(current_rounding_mode == previous_rounding_mode)
      end
    end
  end
end
