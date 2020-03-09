require_relative '../automated_init'

context "Read" do
  number_text = Controls::Number::Text.example

  number = Read.(number_text)

  test do
    control_number = Controls::Number.example

    assert(number == control_number)
  end
end
