# Static Ambassador Crosshair

<img src="https://raw.githubusercontent.com/juniorsgithub/tf2-static-ambassador-crosshair/master/example.gif" alt="Doesn't resize when shooting." width="448" height="252"/>

## What this is

A HUD crosshair built into the on-screen contract progress overlay, which means it can be toggled on and off freely and with no delay.  
Of course this can be used for other purposes then just Ambassador crosshair.  

[github](https://github.com/juniorsgithub/tf2-static-ambassador-crosshair)


## Setup

1. Download the [latest release](https://github.com/juniorsgithub/tf2-static-ambassador-crosshair/releases/latest/download/static-ambassador-crosshair.zip) and extract it into your `/custom` folder

2. If you use a custom HUD

   Inside your HUD's folder, navigate to `/resource/ui` and look for `huditemattributetracker.res`.  
If it is there (doesn't have to), **move** it (not copy) into the `amby-crosshair` folder. If it asks you to overwrite you're doing it right.  
 
## Scripting the crosshair

`tf_contract_progress_show` shows `1` or hides `0` the crosshair  
`tf_contract_competitive_show` ^ but in Valve comp  
`crosshair` shows `1` or hides `0` normal crosshair

<details><summary>Simple example</summary>

```
bind 1 "slot1; xhair_amby"
bind 2 "slot2; xhair_normal"
bind 3 "slot3; xhair_normal"

alias xhair_amby "tf_contract_progress_show 1; tf_contract_competitive_show 1; crosshair 0"
alias xhair_normal "tf_contract_progress_show 0; tf_contract_competitive_show 0; crosshair 1"
```

</details>  
&nbsp;  
<details><summary>With scrolling</summary>

```
bind 1 primwep
bind 2 secwep
bind 3 melwep
bind mwheelup prevwep
bind mwheeldown nextwep

alias xhair_amby "tf_contract_progress_show 1; tf_contract_competitive_show 1; crosshair 0"
alias xhair_normal "tf_contract_progress_show 0; tf_contract_competitive_show 0; crosshair 1"

alias primwep "slot1; xhair_amby  ; alias prevwep melwep ; alias nextwep secwep " 
alias secwep  "slot2; xhair_normal; alias prevwep primwep; alias nextwep melwep "
alias melwep  "slot3; xhair_normal; alias prevwep secwep ; alias nextwep primwep"
```

</details>

Of course, you can also use both crosshairs at the same time.

## Configure your crosshair

To adjust the crosshair open `crosshair.txt` in your text editor of choice.  

<details><summary>crosshair.txt preview</summary>

```
"Resource/UI/HudAchievementTrackerItem.res"{"AmbyCrosshair"{

////////////////////////////////////////
////////// CROSSHAIR SETTINGS //////////
////////////////////////////////////////

// VTF image version
"Image"
{
	visible 		1
	
	xPos			cs-0.5+0
	yPos			cs-0.5+0
	wide			26
	tall			26
	
	image			"replay/thumbnails/cross"
	drawColor		"50 220 0 255"
}

// KnucklesCrosses version
"Text"
{
	visible 		0
	
	xPos			c-240
	yPos			c-240
	wide			480
	tall			480
	
	font			"size:20,outline:off"
	labelText		"·"
	fgColor_override	"50 220 0 255"
}}}

////////////////////////////////////////
////////////// OVERRIDES ///////////////
////////////////////////////////////////

//#base "resource/OnlyWithMinmodeOn.res"
//#base "resource/OnlyWithMinmodeOff.res"
//#base "resource/AboveNormalCrosshair.res"

```

</details>

You can choose between VTF image crosshairs and font based ones (like KnucklesCrosses).  

### VTF Image Crosshairs

Under `"Image"`, between the curly brackets, are properties that control the VTF version of the crosshair.

**visible**  
Show `1` or hide `0` the crosshair.

**xPos**  
Horizontal position. Change the `+0` part to offset it from the center of your screen. Whole numbers only. Left `-`, right `+`.

**yPos**  
Same as xPos but vertical. Up `-`, down `+`.

**wide**, **tall**  
Crosshair scale.

**image**  
Path to the image. Circle, cross, dot and seeker are included, more can be found [here](https://www.teamfortress.tv/50543/vtf-crosshair-pack-2).

**drawColor**  
Crosshair RGBA color (red green blue alpha).  
See this [RGB color picker](http://www.cknuckles.com/rgbsliders.html) for more info.  
Alpha ranges from 0 (transparent) to 255 (opaque).


### Font Crosshairs

Under `"Text"`. You need to have a crosshair font installed to use these.

**visible**  
Show `1` or hide `0` the crosshair.

**xPos**  
Horizontal position. Increment/decrement the number to move it.

**yPos**  
Same as xPos but vertical.

**wide**, **tall**  
Fine-tune the position. More precise than xPos or yPos.  
Lower = left/up, higher = right/down.

**font**  
These days most HUDs come with KnucklesCrosses preinstalled. If yours doesn't, you can follow [this guide](https://www.teamfortress.tv/26790/official-knucklescrosses-release) to set them up.    
With KnuclesCrosses size ranges between 10 and 50. Outline is best kept off.

**labelText**  
The crosshair letter. Refer to [this image](http://i.imgur.com/w0AcH2l.png).

**fgColor_override**  
Crosshair RGBA color (red green blue alpha).  
See this [RGB color picker](http://www.cknuckles.com/rgbsliders.html) for more info.  
Alpha ranges from 0 (transparent) to 255 (opaque).


### Overrides

Using one of these lets you toggle between the crosshair and regular contracts overlay.  
Minmode is controlled by `cl_hud_minmode` (on `1`, off `0`).  
Enable one by removing the `//` from the start of the line.

By default this crosshair is below your usual one, enabling AboveNormalCrosshair changes that.
