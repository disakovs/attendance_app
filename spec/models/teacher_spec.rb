require 'rails_helper'
require 'spec_helper'

RSpec.describe Teacher do
  it "saves itself" do
    teacher = Teacher.new(first_name: "Bob", last_name: "Bobson")
    teacher.save
    expect(Teacher.first).to eq(teacher)
  end
end
