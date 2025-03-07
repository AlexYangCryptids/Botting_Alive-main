class_name Bot

extends AudioStreamPlayer

var can_proceed = true

var cur_num = ""

var target = []


signal input_recieved

func run(): #Base Function
	bus = "Bot"

func input_changed():
	print(cur_num)
	if cur_num in target:
		emit_signal("input_recieved")
	
	
func reset():
	cur_num = ""
	target = []
	
func play_audio(file_path):
	print("Playing audio:", file_path)
	var audio_stream = load(file_path)
	if audio_stream:
		stream = audio_stream
		play()
		can_proceed = false
		
func finished(scene="res://game_scenes/watch_screen_dialing.tscn"):
	play_audio("res://audio/SFX/hangup_beep.mp3")
	await self.finished
	Global.change_scene(scene)
