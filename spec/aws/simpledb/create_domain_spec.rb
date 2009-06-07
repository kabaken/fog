require File.dirname(__FILE__) + '/../../spec_helper'

describe 'SimpleDB.create_domain' do

  after(:all) do
    sdb.delete_domain('create_domain')
  end

  it 'should not include create_domain in list_domains before create_domain' do
    lambda { sdb.list_domains }.should_not eventually { |expected| expected.body[:domains].should_not include('create_domain') }
  end

  it 'should return proper attributes from create_domain' do
    actual = sdb.create_domain('create_domain')
    actual.body[:request_id].should be_a(String)
    actual.body[:box_usage].should be_a(Float)
  end

  it 'should include create_domain in list_domains after create_domain' do
    lambda { sdb.list_domains }.should eventually { |expected| expected.body[:domains].should include('create_domain') }
  end

end