require_relative '../automated_init'

context "Read" do
  context "Non-String is Given" do
    test "Raises type error" do
      assert_raises(TypeError) do
        Read.(:not_a_string)
      end
    end
  end
end
