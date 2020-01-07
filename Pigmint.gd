extends Node2D

onready var Log    = $"/root/Pigmint/Utility/Log"

const APP_NAME     = "PigMint"
const APP_VERSION  = "0.0.1"

# Called when the node enters the scene tree for the first time.
func _ready():
	Log.trace("<Pigmint> _ready")
	OS.set_window_title(APP_NAME + " " + APP_VERSION)

func Log():
	return Log
