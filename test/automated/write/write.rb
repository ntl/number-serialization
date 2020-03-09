require_relative '../automated_init'

context "Write" do
  number = Controls::Number.example

  number_text = Write.(number)

  test do
    control_text = Controls::Number::Text.example

    assert(number_text == control_text)
  end
end
