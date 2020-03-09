require_relative '../automated_init'

context "Defaults" do
  context "Precision" do
    context "ENV variable not set" do
      env = {}

      value = Defaults.precision(env: env)

      test "Value is the maximum precision of a 64-bit float" do
        assert(value == 17)
      end
    end

    context "ENV varibale is set" do
      env = { 'NUMBER_SERIALIZATION_PRECISION' => '11' }

      value = Defaults.precision(env: env)

      test "Value is set to that of the variable" do
        assert(value == 11)
      end
    end
  end
end
