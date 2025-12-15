extends Label

var time

func _process(delta):
	time += delta
	text = str(int(time)) # Show just the seconds.
