require 'test_helper'

class EntryTest < ActiveSupport::TestCase
  test "should not save entry without text" do
    p "say something"
    entry = Entry.new
    assert_not entry.save
  end
end
