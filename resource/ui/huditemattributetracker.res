// User crosshair settings
#base "../../crosshair.txt"
// Default crosshair settings
#base "../AmbyCrosshairDefault.res"
// The rest from the original file
#base "../../huditemattributetracker.res"

"Resource/UI/HudAchievementTrackerItem.res"
{
	// Make sure the container hasn't been modified
	"ItemAttributeTracker"
	{
		fieldName 		"ItemAttributeTracker"
		xPos			0
		yPos			0
		wide			f-400
		tall			480
		visible 		1
		alpha			255
		paintbackground	0
		paintborder		0
		pin_to_sibling	""
	}
	
	"AmbyCrosshair"
	{
		controlName		EditablePanel
		fieldName 		"AmbyCrosshair"
		xPos			0
		yPos			0
		wide			f0
		tall			480
		
		"Image"
		{
			controlName		ImagePanel
			fieldName 		"Image"
			scaleImage		1
		}
		
		"Text"
		{
			controlName		Label
			fieldName 		"Text"
			textAlignment	center
			paintbackground	0
		}
	}
}
