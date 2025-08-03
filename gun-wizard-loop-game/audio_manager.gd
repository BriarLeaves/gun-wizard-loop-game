extends Node #this is taken from one of my (LackOfBeef's) previous games

var music: AudioStreamPlayer
var current_music
var music_off: bool
var music_volume: float
var music_pause_modifier: float = -20
var jingling: bool = false
var sounds_playing = {} #using a dictionary for performance reasons

func _ready():
	process_mode = Node.PROCESS_MODE_ALWAYS
	music = AudioStreamPlayer.new()
	self.add_child(music)
	music.bus = "Music"
	play_music("res://sounds/loop-game-mus-2.ogg", -12)

func play_sound(path: String, volume: float, pitch: float = 1, vary: bool = false, allow_repeats: bool = true):
	if sounds_playing.has(path):
		if allow_repeats:
			sounds_playing[path].play()
		return
	var sound = AudioStreamPlayer.new()
	self.add_child(sound)
	if vary:
		pitch += randf_range(-0.15, 0.15)
	sound.pitch_scale = pitch
	sound.volume_db = volume
	sound.stream = load(path)
	sound.bus = "SFX"
	sounds_playing[path] = sound
	sound.play()
	await sound.finished
	sounds_playing.erase(path)
	sound.queue_free()
	
func play_music(file_path: String, volume_db: float):
	current_music = load(file_path)
	if not jingling:
		music.stream = current_music
		music_volume = volume_db
		music.volume_db = music_volume
		music.play()

func play_jingle(file_path: String, volume_db: float):
	jingling = true
	var timestamp: float = music.get_playback_position()
	music.stop()
	music.volume_db = volume_db
	music.stream = load(file_path)
	music.play()
	await music.finished
	music.stream = current_music
	music.volume_db = music_volume
	music.play(timestamp)
	jingling = false
