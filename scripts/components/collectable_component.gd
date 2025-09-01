extends Node
class_name CollectableComponent

@export var parent : Node3D

var collectables = [0,0]
var collectableDict = {"Primitive" : 0, "Spore" : 1}

func addCollectableAmount(collectable,collectableAmount):
	var collectablePos = collectableDict[collectable]
	collectables[collectablePos] += collectableAmount
