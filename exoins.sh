local bin="/data/local/tmp/exogame"
local fun="https://reiii3.github.io/GVRSH/function/function.sh"
local onprop="https://reiii3.github.io/EXOGAME/bin/prop.sh"
local function="$bin/function"
local prop="$bin/prop"
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
      echo "   ┌[Λ] $name | INFORMATION"
      echo "   ├[📜] Version Modules : $ver | $verc"
      echo "   ├[📤] Version Base : $version | $versionCode"
    if [ "$cek_id" = "$AXERONID" ]; then
      echo "   ├[🪪] ID : $AXERONID | Terverifikasi Beta Test"
    else 
      echo "   ├[🪪] ID : $AXERONID"
    fi
      echo "   └┬[🖲] Game : $nameGame"
      echo "    └[📁] Packages : $runPackage"
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