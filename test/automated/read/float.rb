require_relative '../automated_init'

context "Read" do
  context "Float" do
    {
      '0.0e+00' => 0.0,
      '1.1e+00' => 1.1,
      '1.11e+01' => 11.1,
      '1.111e+02' => 111.1,
      '-1.1e+00' => -1.1,
      '-1.11e+01' => -11.1,
      '-1.111e+02' => -111.1,
      Controls::Float::Minimum.text => Controls::Float::Minimum.raw,
      Controls::Float::Maximum.text => Controls::Float::Maximum.raw
    }.each do |number_text, control_number|
      context "Text: #{number_text}" do
        number = Read.(number_text)

        comment "Expected: #{control_number.inspect}"
        comment "  Actual: #{number.inspect}"

        test do
          assert(number == control_number)
        end
      end
    end
  end
end
