
#random wait method for now
class TimeCop

    def wait (time)
        @wait = Selenium::WebDriver::Wait.new(:timeout => time)    
        puts "Alright we just waited #{time} seconds"
    end

end
