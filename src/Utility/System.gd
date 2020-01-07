extends Node

onready var Log       = $"/root/Pigmint/Utility/Log"
onready var SysTimer1 = $"/root/Pigmint/Utility/System/SysTimer1"

# Trick 1: "Manual print flush": print() output is displayed before quitting application
# -> https://godotengine.org/qa/3962/is-it-possible-to-manually-flush-print
func Quit():
    Log.trace("<System>.Quit")
    SysTimer1.start()

func _on_SysTimer1_timeout():
	get_tree().quit()