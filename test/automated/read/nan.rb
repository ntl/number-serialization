require_relative '../automated_init'

context "Read" do
  context "Not A Number (NaN)" do
    number_text = Controls::Number::NaN::Text.example

    number = Read.(number_text)

    test do
      assert(number.nan?)
    end
  end
end
