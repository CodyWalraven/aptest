require_relative 'main.rb'
require 'fox16'
include Fox

login_controller = Login.new
application = FXApp.new("FXRuby", "FoxTest")
main = FXMainWindow.new(application, "Asset Panda automated testing suite", nil, nil, DECOR_ALL,
       0, 0, 500, 300)


#Account Email Button===================================================
frame3 = FXHorizontalFrame.new(main,
    LAYOUT_LEFT | LAYOUT_SIDE_TOP| PACK_UNIFORM_WIDTH|FRAME_GROOVE)
account_val= FXDataTarget.new("Account Name")
textfield1 = FXTextField.new(frame3, 16, account_val, FXDataTarget::ID_VALUE,TEXTFIELD_NORMAL|LAYOUT_FILL_X|LAYOUT_FILL_COLUMN)

account_val.connect(SEL_COMMAND) do
    $account_email = account_val
end
#=========================================================================


#Password Field===========================================================
frame4 = FXHorizontalFrame.new(main,
    LAYOUT_LEFT | LAYOUT_SIDE_TOP| PACK_UNIFORM_WIDTH|FRAME_GROOVE)
password_val= FXDataTarget.new("Password")
textfield1 = FXTextField.new(frame4, 16, password_val, FXDataTarget::ID_VALUE,TEXTFIELD_NORMAL|LAYOUT_FILL_X|LAYOUT_FILL_COLUMN)
password_val.connect(SEL_COMMAND)do
    $password_full = password_val
end
#=========================================================================

#The login button=========================================================
login_button = FXButton.new(frame4, "Login", nil, application, FXApp::ID_QUIT)
login_button.connect(SEL_COMMAND)do
login_controller.login_system($account_email,$password_full)
end
#=========================================================================



#Buttons to control stuff=================================================
frame2 = FXHorizontalFrame.new(main,
            LAYOUT_LEFT | LAYOUT_CENTER_Y| PACK_UNIFORM_WIDTH|FRAME_GROOVE)
FXButton.new(frame2, "Add Asset", nil, application, FXApp::ID_QUIT)
FXButton.new(frame2, "Perform Check Out", nil, application, FXApp::ID_QUIT)
FXButton.new(frame2, "Delete Asset", nil, application, FXApp::ID_QUIT)
FXButton.new(frame2, "Change Group", nil, application, FXApp::ID_QUIT)
#===========================================================================





application.create()
main.show(PLACEMENT_SCREEN)
application.run()