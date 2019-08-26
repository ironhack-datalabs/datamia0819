
#list of interactable items in the room
room_items= {
	"game room" : {"Couch" : "$10" ,"piano" : {"key" : "A"}, "Door" : "A"},
	"bed room1" : {"Queen Bed": {"key" : "B"}, "Door": ["A","B","C"]},
	"bed room2" : {"Double Bed": {"key" : "C"}, "Dresser":{"key":"D"}, "Door": "B",},
	"target room" : {"Door":["C","D"]}
}
current_room = all_rooms[0]

#["gameroom", "bedroom1"]
all_rooms = list(room_items.keys())

#list of things the player owns. gets appended to when the player finds a new item 
owned_items = []



print(rooms)

def start_game():
	#begins game with message
	print('''You wake up on a couch and find yourself in a strange 
		house with no windows which you have never been to before. 
		You don't remember why you are here and what had happened before.
		You feel some unknown danger is approaching and you must get out of 
		the house, NOW!''')
	play_room(room)

def play_room(room):
	current_room = room

    if(game_state["current_room"] == game_state["target_room"]):
        print("Congrats! You escaped the room!")
    else:
        print("You are now in " + room["name"])
        intended_action = input("What would you like to do? Type 'explore' or 'examine'?").strip()
        if intended_action == "explore":
            explore_room(room)
            play_room(room)
        elif intended_action == "examine":
            examine_item(input("What would you like to examine?").strip(), room)
        else:
            print("Not sure what you mean. Type 'explore' or 'examine'.")
            play_room(room)
        linebreak()


def explore_room(room):


def examine_item(item, room):

	good_input = False
	while good_input == False:
		if room_items[room][item] = :
			good_input = True
		else:
			print("That's not a valid item")
			examine_item(input("What would you like to examine?").strip(), room)










