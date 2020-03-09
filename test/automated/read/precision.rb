require_relative '../automated_init'

context "Read" do
  context "Precision" do
    number_text = "1.11e+01"

    number = Read.(number_text)

    test "All significant figures are preserved" do
      assert(number == BigDecimal('11.1'))
    end
  end
end
