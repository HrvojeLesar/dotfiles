#!/usr/bin/sh

ignored_rule=$(rg "# windowrule = opacity override 0.85, match:class \.\*, match:class negative:\(com\.mitchellh\.ghostty\|spotify\), match:workspace m\[DP\-4\]" ~/.config/hypr/windows.conf)

if [ -z "$ignored_rule" ]; then
    sed --follow-symlinks -i 's/windowrule = opacity override 0.85, match:class .*, match:class negative:(com.mitchellh.ghostty|spotify), match:workspace m\[DP-4\]/# windowrule = opacity override 0.85, match:class .*, match:class negative:(com.mitchellh.ghostty|spotify), match:workspace m\[DP-4\]/g' ~/.config/hypr/windows.conf
else
    sed --follow-symlinks -i 's/# windowrule = opacity override 0.85, match:class .*, match:class negative:(com.mitchellh.ghostty|spotify), match:workspace m\[DP-4\]/windowrule = opacity override 0.85, match:class .*, match:class negative:(com.mitchellh.ghostty|spotify), match:workspace m\[DP-4\]/g' ~/.config/hypr/windows.conf
fi
