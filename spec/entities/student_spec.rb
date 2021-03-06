require 'spec_helper'

describe Tyto::Student do
  before do
    @student = Tyto.db.create_student(username: "Brian",
                                email: "brian@fake.com",
                                phone_number: "1234567890",
                                password: "12983712")
  end

  it "creates a student" do
    expect(@student).to be_a Tyto::Student
    expect(@student.username).to eq "Brian"
    expect(@student.phone_number).to eq "1234567890"
  end

  it "checks password" do
    expect(@student.correct_password?("koolpassword")).to be false
    expect(@student.correct_password?("12983712")).to be true
  end
end
