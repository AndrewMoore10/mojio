RSpec.shared_context "secrets", :a => :b do
  before { @valid_id = "[YOUR APP ID]" }
  before { @valid_secret = "[YOUR SECRET ID]" }
  before { @valid_username = "[EMAIL]" }
  before { @valid_password = "[PASSWORD]" }
end