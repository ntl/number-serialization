require_relative '../automated_init'

context "Read" do
  context "Integer" do
    {
      '0.0e+00' => 0,
      '1.0e+00' => 1,
      '1.1e+01' => 11,
      '1.11e+02' => 111,
      '-1.0e+00' => -1,
      '-1.1e+01' => -11,
      '-1.11e+02' => -111,
      Controls::Integer::Minimum.text => Controls::Integer::Minimum.raw,
      Controls::Integer::Maximum.text => Controls::Integer::Maximum.raw
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
