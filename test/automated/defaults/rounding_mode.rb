require_relative '../automated_init'

context "Defaults" do
  context "Rounding Mode" do
    rounding_mode = Defaults.rounding_mode

    test "Banker's rounding (round the number '5' to nearest even value)" do
      assert(rounding_mode == BigDecimal::ROUND_HALF_EVEN)
    end
  end
end
