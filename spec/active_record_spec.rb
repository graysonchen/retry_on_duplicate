require 'active_record'
class Model < ActiveRecord::Base
end

RSpec.describe ActiveRecord, "Model" do
  subject { Model }

  it { expect(subject.respond_to?(:retry_on_duplicate)).to be true }
end
