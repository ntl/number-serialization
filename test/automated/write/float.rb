require_relative '../automated_init'

context "Write" do
  context "Float" do
    {
      0.0 => '0.0e+00',
      1.1 => '1.1e+00',
      11.1 => '1.11e+01',
      111.1 => '1.111e+02',
      -1.1 => '-1.1e+00',
      -11.1 => '-1.11e+01',
      -111.1 => '-1.111e+02',
      Controls::Float::Minimum.raw => Controls::Float::Minimum.text,
      Controls::Float::Maximum.raw => Controls::Float::Maximum.text
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
      number_text = Write.(11.11, precision: 3)

      test "Number is rounded" do
        assert(number_text == "1.11e+01")
      end
    end
  end
end
