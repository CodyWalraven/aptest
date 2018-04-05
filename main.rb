require "selenium-webdriver"


#random wait method for now, will put in class later

class TimeCop

    def wait (time)
        @wait = Selenium::WebDriver::Wait.new(:timeout => time)    
        puts "Alright we just waited #{time} seconds"
    end

end



class Login
    attr_accessor :email, :password
 
    def initialize      
        $driver = Selenium::WebDriver.for :chrome
        $driver.navigate.to "https://login.assetpanda.com/asset_items"
        @login_element = $driver.find_element(name: 'user[email]')
        @password_element = $driver.find_element(name: 'user[password]')
        @submit_element = $driver.find_element(name: "commit")               
    end

    def login_system (email,password)
        @password_from_file = File.readlines 'passwords.txt'
        @password_from_file.each_with_index{|line, i| puts "#{i+1}: #{line}"}
        @email = email
        @password = password
        
        @password_element.send_keys @password
        @login_element.send_keys email
        @submit_element.submit
    end

    def reset_password
        @reset_link = $driver.find_element(name: '')
    end

end






class Asset
    def initialize    
    end

    def click_assets
        $driver.navigate.to "https://login.assetpanda.com/asset_items"       
    end

    def click_add_new_asset
        $driver.navigate.to "https://login.assetpanda.com/asset_items/new"
    end

    def input_asset_info(name)
        name_field = $driver.find_element(name: 'values[field_3]')
        name_field.send_keys(name)   
    end

    def save
        #This really just presses enter, but eh it saves the item
        $driver.action.send_keys(:enter).perform
    
    end

        
end


class StrawPoll
    def initialize
        $driver = Selenium::WebDriver.for :chrome
    end

    def navigate_to
        $driver.navigate.to "https://www.poll-maker.com/poll1921682x73c44DB0-53#"
    end

    def click_yes
        yes_field = $driver.find_element(name: 'qp_v1921682')
        yes_field.submit
      
    end
end

=begin
usetrace = Login.new("usetrace@assetpanda.com")
usetrace.login

usetrace_asset = Asset.new
usetrace_asset.click_assets
usetrace_asset.click_add_new_asset
usetrace_asset.input_asset_info("LYNN LOVES chihuahuas")
usetrace_asset.press_save_button
usetrace_asset.click_assets


puts "Press enter to finish"
pause = gets.chomp
=end


