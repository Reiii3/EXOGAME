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
    axprop $prop nameGame -s "$2"
    nameGame="$2"
    shift 2
    pkg=$(pm list packages | grep -i "$nameGame" | sed 's/package://g')
    axprop $path_axeronprop runPackage -s "$pkg"
    runPackage="$pkg"
fi
if [ -n "$1" ] && [ "$1" == "-v" ];then
    renderer="$2"
    shift 
fi

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