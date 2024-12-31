# OverTime (OT) Damage Numbers
## Incrementing Sum
Damage sum if OT uses incrementing sum
```
# Damage: 1 on tick: 1
# Total damage: 1
# ...
# Damage: 100 on tick: 100
# Total damage: 5050
```


## Triangular Number Sum
Damage sum if OT uses triangular number sum
```
# Damage: 1 on tick: 1
# Total damage: 1
# ...
# Damage: 465 on tick: 30
# Total damage: 4960
# ...
# Damage: 820 on tick: 40
# Total damage: 11480
```


# Rich Text and BBCODE
Reference: [BBCode in RichTextLabel](https://docs.godotengine.org/en/4.3/tutorials/ui/bbcode_in_richtextlabel.html#using-push-tag-and-pop-functions-instead-of-bbcode)


```godot
extends RichTextLabel

func _ready():
	append_text("BBCode ")  # Trailing space separates words from each other.
	push_color(Color.GREEN)
	append_text("test ")  # Trailing space separates words from each other.
	push_italics()
	append_text("example")
	pop()  # Ends the tag opened by `push_italics()`.
	pop()  # Ends the tag opened by `push_color()`.
```

## BBCODE Example scene text
```python
"RichTextLabel is a flexible way of adding text to your project, with support for [i]italics[/i], [b]bold[/b] and [i][b]both[/b][/i].
[u]Underline[/u] and [s]strikethrough[/s] work too, including with [u][i]italics[/i][/u], [u][b]bold[/b][/u] and [u][i][b]both[/b][/i][/u].

Text [color=#4cf]color[/color], [fgcolor=#49c9]foreground [color=#4cf]color[/color][/fgcolor]  and  [bgcolor=#49c9]background [color=#4cf]color[/color][/bgcolor]  can be adjusted.

It's also possible to include [img]res://unicorn_icon.png[/img] [font_size=24]custom images[/font_size], as well as [color=aqua][url=https://godotengine.org]custom URLs[/url][/color]. [hint=This displays a hint.]Hover this to display a tooltip![/hint]
Left alignment is default,[center]but center alignment is supported,[/center][right]as well as right alignment.[/right]

[fill][dropcap font_size=48 color=yellow margins=0,-10,0,-12]F[/dropcap]ill alignment is also supported, and allows writing very long text that will end up fitting the horizontal space entirely with words of joy. Drop caps are also supported. When using a drop cap, the first character of a paragraph is made larger, taking up several lines of text and optionally using a specific font or color.[/fill]

Several effects are also available:    [pulse]Pulse[/pulse]    [wave]Wave[/wave]    [tornado]Tornado[/tornado]    [shake]Shake[/shake]    [fade start=75 length=7]Fade[/fade]    [rainbow]Rainbow[/rainbow]

[table=2]
[cell border=#fff3 bg=#fff1]
[ul]
Tables
are supported.
[/ul]
[/cell]
[cell border=#fc13 bg=#fc11]
[ol]
Ordered
list example.
[/ol]
[/cell]

[/table]

You can also create custom tags/effects, or customize behavior of [lb]url[rb] tags on click. For full reference, [color=aqua][url=https://docs.godotengine.org/en/latest/tutorials/gui/bbcode_in_richtextlabel.html]check the documentation.[/url][/color]

"
```

# Game Settings
## Display
Below are a few common display resolutions in the 16:9 aspect ratio.
```python
720p: 1280 x 720 pixels, a high-definition (HD) standard 
1080p: 1920 x 1080 pixels, also known as full HD 
1440p: 2560 x 1440 pixels, also known as QHD or Quad HD 
4K UHD: 3840 x 2160 pixels 
8K UHD: 7680 x 4320 pixels, the highest monitor resolution currently available 
640 x 360 (nHD)
854 x 480 (FWVGA)
960 x 540 (qHD)
1024 x 576 (WSVGA)
1366 x 768 (FWXGA)
1600 x 900 (HD+)
2048 x 1152 (QWXGA)
3200 x 1800 (WQXGA+)
5120 x 2880 (UHD+)
```

# Documentation
## Uuid
```
https://godotengine.org/asset-library/asset/81
https://github.com/binogure-studio/godot-uuid/tree/master
```
