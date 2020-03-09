require_relative '../automated_init'

context "Read" do
  context "Malformed Text is Given" do
    test "Raises error" do
      assert_raises(Read::Error) do
        Read.('malformed-number')
      end
    end
  end
end
