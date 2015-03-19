# -*- coding: utf-8 -*-

RSpec.describe 'AppiumJenkinsDemo' do
  let!(:x) { 15 }
  let!(:y) { 5 }

  context 'subtraction' do
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

    it 'subtract two numbers' do
      $driver.find_element(:accessibility_id, 'subButton').click

      result = $driver.find_element(:accessibility_id, 'resultTextView').value.to_i
      expect(result).to eq(x - y) 
    end
  end
end
