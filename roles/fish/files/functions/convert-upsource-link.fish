function convert-upsource-link --description "converts a local link to upsource link (completely depends on my config though)"
	string replace 127.0.0.1:12345 oddev001s.sys.meshcore.net:8080 (xclip -selection c -o) | xclip -selection c
end
