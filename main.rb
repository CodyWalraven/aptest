require "selenium-webdriver"


#random wait method for now, will put in class later
def wait (time)
    $wait = Selenium::WebDriver::Wait.new(:timeout => time)    
    puts "Alright we just waited #{time} seconds"
end



class Login
    attr_accessor :email, :password
 
    def initialize(email)        
        $driver = Selenium::WebDriver.for :chrome
        $driver.navigate.to "https://login.assetpanda.com/asset_items"
        @email = email
        @login_element = $driver.find_element(name: 'user[email]')
        @password_element = $driver.find_element(name: 'user[password]')
        @submit_element = $driver.find_element(name: "commit")               
    end

    def login
        password = File.readlines 'passwords.txt'
        password.each_with_index{|line, i| puts "#{i+1}: #{line}"}
        @login_element.send_keys @email
        puts "The password we are using is #{password}"
        @password_element.send_keys password
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

    def press_save_button
        #This really just presses enter, but eh it saves the item
        $driver.action.send_keys(:enter).perform
    
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


