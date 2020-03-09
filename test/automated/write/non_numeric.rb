require_relative '../automated_init'

context "Read" do
  context "Non-numeric Input is Given" do
    context "String" do
      test "Raises type error" do
        assert_raises(TypeError) do
          Write.('111')
        end
      end
    end

    context "Object" do
      test "Raises type error" do
        assert_raises(TypeError) do
          Write.(Object.new)
        end
      end
    end
  end
end
