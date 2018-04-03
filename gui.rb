require_relative 'main.rb'

require 'fox16'
include Fox

application = FXApp.new("FXRuby", "FoxTest")

main = FXMainWindow.new(application, "Asset Panda automated testing suite", nil, nil, DECOR_ALL,
       0, 0, 500, 300)
#comment to stop the dumb automforatting of vs code




FXButton.new(main, "Button 1", nil, application, FXApp::ID_QUIT)
FXButton.new(main, "Login", nil, application, FXApp::ID_QUIT)









application.create()
main.show(PLACEMENT_SCREEN)
application.run()