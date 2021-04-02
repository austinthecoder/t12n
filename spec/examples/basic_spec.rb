# frozen_string_literal: true

RSpec.describe "examples" do
  it "basic" do
    t12n = T12n.start

    users = [
      Ivo.(id: 1, name: "John"),
      Ivo.(id: 2, name: "Jan"),
    ]

    t12n.define_schema :user do
      attrs(:id, :name)
    end

    schema = t12n.fetch_schema(:user)

    result = users.map do |user|
      schema.attrs.map do |attr|
        attr.serializer.(user)
      end
    end

    expect(result).to eq([
      [1, "John"],
      [2, "Jan"],
    ])
  end
end
