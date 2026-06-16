{
	"patcher" : 	{
		"fileversion" : 1,
		"appversion" : 		{
			"major" : 8,
			"minor" : 3,
			"revision" : 5,
			"architecture" : "x64",
			"modernui" : 1
		},
		"classnamespace" : "box",
		"rect" : [ 34, 79, 1450, 950 ],
		"bglocked" : 0,
		"openinpresentation" : 0,
		"bgsize" : 1450,
		"bgheight" : 950,
		"bgcolor" : [ 0.15, 0.15, 0.15, 1.0 ],
		"title" : "Master Meter Plus - Full Feature",
		"boxes" : [ 
			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "audio-in",
					"patching_rect" : [ 20, 90, 100, 22 ],
					"numoutlets" : 2,
					"outlettype" : [ "signal", "signal" ],
					"numinlets" : 0,
					"id" : "obj-audio-in"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LOUDNESS HISTORY",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 20, 130, 200, 20 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "spectroscope~",
					"patching_rect" : [ 20, 155, 240, 130 ],
					"bgcolor" : [ 0.05, 0.05, 0.05, 1.0 ],
					"bordercolor" : [ 0.4, 0.4, 0.4, 0.5 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-loudness-history"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "INTEGRATED",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 20, 300, 200, 20 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 30, 325, 80, 40 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.95, 0.4, 1.0 ],
					"fontsize" : 28,
					"fontweight" : "bold",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-integrated-lufs"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 75, 295, 50, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 11,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-max-level"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 125, 295, 50, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 11,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-momentary-lufs"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 30, 325, 50, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.95, 0.4, 1.0 ],
					"fontsize" : 11,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-true-peak"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 125, 325, 50, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 11,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-lra"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "PENALTY (vs. target dB)",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 270, 130, 240, 30 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 270, 165, 240, 260 ],
					"bgcolor" : [ 0.08, 0.08, 0.08, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 180, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-spotify"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 205, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-apple"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 230, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-youtube"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 255, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-amazon"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 280, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-deezer"
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 280, 305, 60, 20 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 0.4, 0.4, 1.0 ],
					"fontsize" : 10,
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-penalty-tidal"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Spotify\nApple\nYouTube\nAmazon\nDeezer\nTidal",
					"fontsize" : 10,
					"patching_rect" : [ 210, 180, 70, 140 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "LEVELS",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 520, 130, 200, 20 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "panel",
					"patching_rect" : [ 520, 155, 360, 260 ],
					"bgcolor" : [ 0.08, 0.08, 0.08, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "meter~",
					"patching_rect" : [ 530, 170, 20, 200 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-meter-1"
				}
			},
			{
				"box" : 				{
					"maxclass" : "meter~",
					"patching_rect" : [ 600, 170, 20, 200 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-meter-2"
				}
			},
			{
				"box" : 				{
					"maxclass" : "meter~",
					"patching_rect" : [ 630, 170, 20, 200 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-meter-3"
				}
			},
			{
				"box" : 				{
					"maxclass" : "meter~",
					"patching_rect" : [ 660, 170, 20, 200 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-meter-4"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "SPECTRAL BALANCE",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 900, 130, 240, 20 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "spectroscope~",
					"patching_rect" : [ 900, 155, 200, 130 ],
					"bgcolor" : [ 0.05, 0.05, 0.05, 1.0 ],
					"bordercolor" : [ 0.4, 0.4, 0.4, 0.5 ],
					"numinlets" : 1,
					"numoutlets" : 0,
					"id" : "obj-spectral"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "SOUND FIELD",
					"fontsize" : 11,
					"fontweight" : "bold",
					"patching_rect" : [ 1110, 130, 240, 20 ],
					"textcolor" : [ 0.85, 0.85, 0.85, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "number",
					"patching_rect" : [ 1120, 160, 80, 40 ],
					"bgcolor" : [ 0.12, 0.12, 0.12, 1.0 ],
					"textcolor" : [ 1.0, 1.0, 1.0, 1.0 ],
					"fontsize" : 20,
					"fontweight" : "bold",
					"numinlets" : 1,
					"numoutlets" : 2,
					"outlettype" : [ "", "bang" ],
					"id" : "obj-correlation"
				}
			},
			{
				"box" : 				{
					"maxclass" : "comment",
					"text" : "Phase Correlation",
					"fontsize" : 9,
					"patching_rect" : [ 1120, 210, 80, 20 ],
					"textcolor" : [ 0.6, 0.6, 0.6, 1.0 ]
				}
			},
			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "audio-out",
					"patching_rect" : [ 20, 500, 100, 22 ],
					"numoutlets" : 0,
					"numinlets" : 2,
					"id" : "obj-audio-out"
				}
			},
			{
				"box" : 				{
					"maxclass" : "newobj",
					"text" : "js loudness_processor.js",
					"patching_rect" : [ 20, 400, 200, 22 ],
					"numoutlets" : 8,
					"outlettype" : [ "", "", "", "", "", "", "", "" ],
					"numinlets" : 2,
					"id" : "obj-loudness-processor"
				}
			}
		],
		"lines" : [ 
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-loudness-history", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-meter-1", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 1 ],
					"target" : [ "obj-meter-2", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-meter-3", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 1 ],
					"target" : [ "obj-meter-4", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-spectral", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-loudness-processor", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 1 ],
					"target" : [ "obj-loudness-processor", 1 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 0 ],
					"target" : [ "obj-integrated-lufs", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 1 ],
					"target" : [ "obj-momentary-lufs", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 2 ],
					"target" : [ "obj-max-level", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 3 ],
					"target" : [ "obj-true-peak", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 4 ],
					"target" : [ "obj-lra", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 5 ],
					"target" : [ "obj-penalty-spotify", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 6 ],
					"target" : [ "obj-penalty-apple", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-loudness-processor", 7 ],
					"target" : [ "obj-correlation", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 0 ],
					"target" : [ "obj-audio-out", 0 ]
				}
			},
			{
				"patchline" : 				{
					"source" : [ "obj-audio-in", 1 ],
					"target" : [ "obj-audio-out", 1 ]
				}
			}
		]
	}
}
