# -*- coding: utf-8 -*-

RSpec.describe 'AppiumJenkinsDemo' do
  let!(:x) { 7 }
  let!(:y) { 3 }

  context 'addition' do
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

    it 'add two numbers' do
      $driver.find_element(:accessibility_id, 'addButton').click

      result = $driver.find_element(:accessibility_id, 'resultTextView').value.to_i
      expect(result).to eq(x + y) 
    end
  end
end
