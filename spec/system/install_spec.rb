require 'spec_helper_system'

describe 'install:' do

  it 'test loading class with no parameters' do
    pp = <<-EOS.unindent
      class { 'datadog': }
    EOS

    puppet_apply(pp) do |r|
      r.exit_code.should == 2
      r.refresh
      r.exit_code.should == 0
    end
  end

  describe port(17123) do
    it { should be_listening }
  end

  describe port(17125) do
    it { should be_listening }
  end

  describe port(8125) do
    it { should be_listening }
  end

end
