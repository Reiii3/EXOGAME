local bin="/data/local/tmp/exogame"
local fun="https://reiii3.github.io/GVRSH/function/function.sh"
local onprop="https://reiii3.github.io/EXOGAME/bin/prop.sh"
local function="$bin/function"
local prop="$bin/prop"
local p="[-]"
if [ ! -f $bin ]; then
  mkdir -p "$bin"
fi

$AXFUN
import axeron.prop
if [ ! -f "$prop" ] && [ ! -f "$function" ]; then
  storm -rP "$bin" -s "${fun}" -fn "function" "$@"
  sleep 1
  storm -rP "$bin" -s "${onprop}" -fn "prop" "$@"
fi
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
      echo "   ┌[Λ] $name | INFORMATION"
      sleep 0.3
      echo "   ├$p Version Modules : $ver | $verc"
      sleep 0.3
      echo "   ├$p Version Base : $version | $versionCode"
      sleep 0.3
    if [ "$cek_id" = "$AXERONID" ]; then
      echo "   ├$p' ID : $AXERONID | Terverifikasi Beta Test"
      sleep 0.3
    else 
      echo "   ├$p ID : $AXERONID"
      sleep 0.3
    fi
      echo "   └┬$p Game : ${nameGame:-null}"
      sleep 0.3
      echo "    └$p Packages : ${runPackage:-null}"
      exit 0
    ;;
esac

if [ $cek_beta != true ]; then
  if [ $maintenance = true ]; then
     echo "   ======================="
     printer "     EXOGAME 1.0 BETA ON"
     echo "   ======================="
     printer "       [comming soon]"
     echo
     printer " Developer : $dev"
     echo
     printer "[IN THE PROCESS OF MANUFACTURING]"
     sleep 1
     exit 0
  fi
fi

echo "Tesssss"