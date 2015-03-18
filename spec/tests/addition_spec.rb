# -*- coding: utf-8 -*-

RSpec.describe 'AppiumJenkinsDemo' do
  def clear_view
    $driver.find_element(:accessibility_id, 'xTextField').clear
    $driver.find_element(:accessibility_id, 'yTextField').clear
    $driver.find_element(:accessibility_id, 'sumTextView').clear
  end

  let(:x) { 5 }
  let(:y) { 3 }

  before do
    clear_view

    $driver.find_element(:accessibility_id, 'xTextField').send_key(x)
    $driver.find_element(:accessibility_id, 'yTextField').send_key(y)

    $driver.find_element(:accessibility_id, 'addButton').click
  end

  after do |example|
    if example.exception
      example.metadata[:failed_screenshot] = Screenshot.capture_screenshot
    end
  end

  it 'when test are passing' do
    sum = $driver.find_element(:accessibility_id, 'sumTextView').value.to_i
    expect(sum).to eq(x + y) 
  end

  it 'when test are failing' do
    sum = $driver.find_element(:accessibility_id, 'sumTextView').value.to_i
    expect(sum).to eq(x - y) 
  end
end
