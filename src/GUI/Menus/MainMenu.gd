extends HBoxContainer

onready var FileSubmenu = $"/root/Pigmint/View/Menus/MainMenu/FileSubmenu"

# Called when the node enters the scene tree for the first time.
func _ready():
	print("<MainMenu> _ready")
	FileSubmenu.get_popup().add_item("Open...")
	FileSubmenu.get_popup().add_item("Save As...")
	FileSubmenu.get_popup().add_item("Quit")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_FileSubmenu_pressed():
    print("_on_FileSubmenu_pressed")
    #get_popup().show()
