# -*- coding: utf-8 -*-

RSpec.describe 'AppiumJenkinsDemo' do
  let(:x) { 9 }
  let(:y) { 3 }

  before do
    $driver.find_element(:accessibility_id, 'resetButton').click

    $driver.find_element(:accessibility_id, 'xTextField').send_key(x)
    $driver.find_element(:accessibility_id, 'yTextField').send_key(y)
  end

  after do |example|
    if example.exception
      example.metadata[:failed_screenshot] = Screenshot.capture_screenshot
    end
  end

  it 'will add' do
    $driver.find_element(:accessibility_id, 'addButton').click

    sum = $driver.find_element(:accessibility_id, 'resultTextView').value.to_i
    expect(sum).to eq(x + y) 
  end

  it 'will subtract' do
    $driver.find_element(:accessibility_id, 'subButton').click

    sum = $driver.find_element(:accessibility_id, 'resultTextView').value.to_i
    expect(sum).to eq(x - y) 
  end
end
