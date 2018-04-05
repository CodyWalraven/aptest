require "selenium-webdriver"

class Login
    attr_accessor :email, :password
 
    def initialize      
        $driver = Selenium::WebDriver.for :chrome
        $driver.navigate.to "https://login.assetpanda.com/asset_items"
        @login_element = $driver.find_element(name: 'user[email]')
        @password_element = $driver.find_element(name: 'user[password]')
        @submit_element = $driver.find_element(name: "commit")               
    end

    def login_system (email,password,load_from_file)
        if load_from_file == true
            @password_from_file = File.readlines 'passwords.txt'
            @password_from_file.each_with_index{|line, i| puts "#{i+1}: #{line}"}
            @email_from_file = File.readlines 'email.txt'
            @email_from_file.each_with_index{|line,i| puts "#{i+1}: #{line}"}
            @login_element.send_keys @email_from_file
            @password_element.send_keys @password_from_file
            @submit_element.submit

        elsif load_from_file = false    
            @email = email
            @password = password
            @password_element.send_keys @password
            @login_element.send_keys email
            @submit_element.submit
        
        else
            raise "Uh oh you need to only put true or false in load_from_file"
        end
    end

    def reset_password
        @reset_link = $driver.find_element(name: '')
    end

end
