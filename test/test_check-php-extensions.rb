require_relative 'spec_helper.rb'
require_relative './plugin_stub.rb'

require_relative '../bin/check-php-extensions.rb'

describe CheckPHPExtensions do
  it 'Test valid extension' do
    check = CheckPHPExtensions.new
    check[:extension] = 'date'
    expect(-> { io.run }).to raise_error SystemExit
  end
end

