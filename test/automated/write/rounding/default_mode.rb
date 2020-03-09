require_relative '../../automated_init'

context "Write" do
  context "Rounding" do
    context "Default Mode (Banker's Rounding)" do
      previous_rounding_mode = BigDecimal.mode(BigDecimal::ROUND_MODE)

      refute(previous_rounding_mode == Defaults.rounding_mode)

      context "Rounded digit is less than 5" do
        number_text = Write.(1114, precision: 3)

        test "Serialized number is rounded down" do
          assert(number_text == '1.11e+03')
        end
      end

      context "Rounded digit is greater than 5" do
        number_text = Write.(1116, precision: 3)

        test "Serialized number is rounded up" do
          assert(number_text == '1.12e+03')
        end
      end

      context "Rounded digit is 5" do
        context "Preceding digit is even" do
          number_text = Write.(1125, precision: 3)

          test "Serialized number is rounded down" do
            assert(number_text == '1.12e+03')
          end
        end

        context "Preceding digit is odd" do
          number_text = Write.(1115, precision: 3)

          test "Serialized number is rounded up" do
            assert(number_text == '1.12e+03')
          end
        end
      end

      test "Previous rounding mode is restored" do
        current_rounding_mode = BigDecimal.mode(BigDecimal::ROUND_MODE)

        assert(current_rounding_mode == previous_rounding_mode)
      end
    end
  end
end
