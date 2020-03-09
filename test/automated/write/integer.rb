require_relative '../automated_init'

context "Write" do
  context "Integer" do
    {
      0 => '0.0e+00',
      1 => '0.1e+01',
      11 => '1.1e+01',
      111 => '1.11e+02',
      -1 => '-0.1e+01',
      -11 => '-1.1e+01',
      -111 => '-1.11e+02',
      Controls::Integer::Minimum.raw => Controls::Integer::Minimum.text,
      Controls::Integer::Maximum.raw => Controls::Integer::Maximum.text
    }.each do |integer, control_text|
      context "Value: #{integer}" do
        number_text = Write.(integer)

        comment "Expected: #{control_text.inspect}"
        comment "  Actual: #{number_text.inspect}"

        test do
          assert(number_text == control_text)
        end
      end
    end

    context "Significant digits exceeds precision" do
      number_text = Write.(1111, precision: 3)

      test "Number is rounded" do
        assert(number_text == "1.11e+03")
      end
    end
  end
end
