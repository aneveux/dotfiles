yk() {
    ykman oath accounts code "$1" -s | xclip
}

alias totp=yk

alias aws2fa="ykman oath accounts code 'aws:aneveux' -s | xclip"

