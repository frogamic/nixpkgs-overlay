final: prev: { bin, name ? "", crop ? "", title ? "" }: prev.writeScriptBin "${bin}" ''
	#! ${prev.stdenv.shell}
		${if name != "" then ''
			adb shell monkey -p '${name}' \
				-c android.intent.category.LAUNCHER 1 \
				> /dev/null
		'' else ""}
	exec ${prev.scrcpy}/bin/scrcpy -Sw \
		--window-title '${if title == "" then bin else title}' \
		${if crop != "" then "--crop '${crop}'" else ""} \
		--render-driver opengl \
		--bit-rate 12M
''
