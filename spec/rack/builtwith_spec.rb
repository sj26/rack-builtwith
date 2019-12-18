RSpec.describe Rack::BuiltWith do
  let(:app) do
    Rack::Lint.new(lambda { |env|
      [ 200, { "Content-Type" => "text/plain" }, ["Hello, world!"] ]
    })
  end

  let(:stack) { Rack::BuiltWith.new(app) }

  it "returns the correct response" do
    expect(Rack::MockRequest.new(stack).get("/")).to be_ok & have_attributes(body: "Hello, world!")
    expect(Rack::MockRequest.new(stack).post("/builtwith.txt")).to be_ok & have_attributes(body: "Hello, world!")
    expect(Rack::MockRequest.new(stack).get("/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5vcmc=")
  end

  it "varies the response by host" do
    expect(Rack::MockRequest.new(stack).get("https://example.org/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5vcmc=")
    expect(Rack::MockRequest.new(stack).get("https://example.com/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5jb20=")
    expect(Rack::MockRequest.new(stack).get("https://sub.example.net/builtwith.txt")).to be_ok & have_attributes(body: "c3ViLmV4YW1wbGUubmV0")
  end

  context "with a fixed host" do
    let(:stack) { Rack::BuiltWith.new(app, "example.com") }

    it "always returns that host" do
      expect(Rack::MockRequest.new(stack).get("https://example.com/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5jb20=")
      expect(Rack::MockRequest.new(stack).get("https://example.org/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5jb20=")
      expect(Rack::MockRequest.new(stack).get("https://sub.example.net/builtwith.txt")).to be_ok & have_attributes(body: "ZXhhbXBsZS5jb20=")
    end
  end
end
