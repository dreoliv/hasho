require 'hasho'

class User
  include Hasho

  def name
    "John Smith"
  end

  def email
    "john@example.com"
  end
end

class IncludeUser
  include Hasho

  hash_methods :name, :email

  def name
    "John Smith"
  end

  def email
    "john@example.com"
  end

  def password
    "secret!"
  end
end

describe Hasho do
  subject { User.new }

  it "adds a to_h method to the class" do
    expect(subject).to respond_to :to_h
  end

  context "default behavior" do
    it "generates a hash object with the data returned from the object's public interface methods" do
      expect(subject.to_h).to eq({
        name: "John Smith",
        email: "john@example.com",
      })
    end
  end

  context "when the hash methods are specified" do
    it "includes only the specified methods in the hash" do
      subject = IncludeUser.new

      expect(subject.to_h).to eq({
        name: "John Smith",
        email: "john@example.com",
      })
    end
  end
end
