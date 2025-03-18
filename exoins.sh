local bin="/data/local/tmp/exogame"
local fun="https://reiii3.github.io/Center-Modules/core-system/function.sh"
local onprop="https://reiii3.github.io/EXOGAME/bin/prop.sh"
local changelogs="https://reiii3.github.io/EXOGAME/bin/changelogs.sh"
local mainten="https://reiii3.github.io/EXOGAME/bin/maintenance.sh"
local function="$bin/function"
local prop="$bin/prop"
local p="[-]"
if [ ! -f $bin ]; then
  mkdir -p "$bin"
fi

$AXFUN
import axeron.prop
storm -rP "$bin" -s "${fun}" -fn "function" "$@"
sleep 1
storm -rP "$bin" -s "${onprop}" -fn "prop" "$@"
local cek_id=$(storm "https://reiii3.github.io/EXOGAME/user/beta.txt")
local cek_beta=$(echo "$cek_id" | grep -q "$AXERONID" && echo true || echo false)
. $function
. $prop

if [ -n "$1" ] && [ "$1" == "-g" ];then
    pkg=$(pm list packages | grep -i "$2" | sed 's/package://g')
    axprop $path_axeronprop runPackage -s "$pkg"
    runPackage="$pkg"
    # Mengubah Packagee Menjadi Nama Game
    game=$(pkglist -L "$pkg")
    axprop $prop nameGame -s "$game"
    nameGame="$game"
    shift 2
fi
if [ -n "$1" ] && [ "$1" == "-v" ];then
    renderer="$2"
    shift 
fi

case $1 in
    --info | -i )
  echo "   ┌[Λxeron] $name | INFORMATION"
  sleep 0.3
  echo "   ├$p Version Modules : $ver | $verc"
  sleep 0.3
  echo "   ├$p Version Base : $version | $versionCode"
  sleep 0.3
      if [ "$cek_id" = "$AXERONID" ]; then
  echo "   ├$p' ID : $AXERONID | Terverifikasi Beta Test"
  sleep 0.3
      else 
  echo "   ├$p ID : $AXERONID | your need beta?, pm Developers"
  sleep 0.3
      fi
  echo "   └┬$p Game : ${nameGame:-addGame}"
  sleep 0.3
  echo "    └$p Packages : ${runPackage:-null}"
  sleep 0.3
  exit 0
    ;;
    --changelogs | -c )
    storm -x "$changelogs" -fn "changelogs" "$@"
    exit 0
    ;;
esac

if [ $cek_beta != true ]; then
  if [ $maintenance = true ]; then
     storm -x "$mainten" -fn "maintenance" "$@"
     exit 0
  fi
fi

echo "======================================"
printer "    Welcome To Modules EXOGAME VIP"
printer "          Powered by Λxeron"
echo "======================================"
printer "       INFORMATION EXOGAME"
printer "  -Modules Version: ${ver} | ${verc}"
sleep 0.5
printer "  -Base Version: ${version} | ${versionCode}"
sleep 0.5
printer "  -Developer: "
sleep 0.5
if [ -f $system ]; then
  printer "  -Status: Active"
  sleep 0.5
else 
  printer "  -Status: Non Active"
  sleep 0.5
fi
printer "  -Play Game: ${nameGame:-null}"
sleep 0.5
echo "======================================"

if [ ! -f "$system" ]; then 
  echo
  echo "==============================="
  printer "  [INSTALATION SYSTEM MODULES"
  printer "           [Active]"
  echo "==============================="
  echo
  echo "" > "$system"
 else 
  echo 
  printer "     [SYSTEM ACTIVED]"
  echo 
fi

echo "     ============================="
printer "  [PENYESUAIAN SYSTEM GAME]"
echo "     ============================="
printer "   [Ekstraking System]"
if [ -z $renderer ]; then
 printer "-[ RENDER SELECTION ]: [opengl]"
 setprop debug.hwui.renderer opengl
else 
 printer "-[ RENDER SELECTION ]: [${renderer}]"
 setprop debug.hwui.renderer $renderer
fi
printer "-[ SYSTEM COMPILER ]: [Succes]"
printer "-[ DRIVER GAME ]: [Active]"
printer "-[ ADD NEW ]: [COMMING SOON]"