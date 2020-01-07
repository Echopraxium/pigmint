extends Node

onready var System          = $"/root/Pigmint/Utility/System"
onready var Log             = $"/root/Pigmint/Utility/Log"
onready var FileSubmenu     = $"/root/Pigmint/View/Menus/MainMenu/FileSubmenu"
onready var HelpSubmenu     = $"/root/Pigmint/View/Menus/HelpSubmenu"

onready var FileOpenDialog  = $"/root/Pigmint/View/Dialogs/FileOpenDialog"
onready var HelpAboutDialog = $"/root/Pigmint/View/Dialogs/HelpAboutDialog"

var HelpSubMenuWidth = 0

# Called when the node enters the scene tree for the first time.
func _ready():
	createFileMenu()
	createHelpMenu()
	
	# Trick 2: Help submenu anchored to right
	HelpSubMenuWidth = HelpSubmenu.get_size().x

func createFileMenu():
    FileSubmenu.get_popup().add_item("New")
    FileSubmenu.get_popup().add_item("Open...")
    FileSubmenu.get_popup().add_item("Save As...")
    FileSubmenu.get_popup().add_item("Quit")
    FileSubmenu.get_popup().connect("id_pressed", self, "_on_file_menu_item_pressed")
	
func createHelpMenu():
    HelpSubmenu.get_popup().add_item("About...")
    HelpSubmenu.get_popup().connect("id_pressed", self, "_on_help_menu_item_pressed")

func _on_file_menu_item_pressed(id):
    #hideOtherPopups()
    var item_name = FileSubmenu.get_popup().get_item_text(id)
    if (item_name == "New"):
        pass
    elif (item_name == "Open..."):
        FileOpenDialog.popup_centered()
    elif (item_name == "Save As..."):
        #FileSaveAsDialog.popup_centered()
        pass
    elif (item_name == "Quit"):
        System.Quit()
	
	
func _on_help_menu_item_pressed(id):
    #hideOtherPopups()
    var item_name = FileSubmenu.get_popup().get_item_text(id)
    if (item_name == "About..."):
        FileOpenDialog.popup_centered()

# Trick 2: Help submenu anchored to right
func _on_MainMenu_resized():
	if (Log != null):
        #Log.trace("<MainMenu> resized")
        var viewport = get_viewport()
        var size = viewport.size
        HelpSubmenu.set_position(Vector2(size.x - HelpSubMenuWidth, 0)) 
