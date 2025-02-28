bin="/data/local/tmp/exogame"
fun="https://reiii3.github.io/GVRSH/function/function.sh"
onprop="https://reiii3.github.io/EXOGAME/bin/prop.sh"
function="$bin/function"
prop="$bin/prop"
if [ ! -f $bin ]; then
  mkdir -p "$bin"
fi

$AXFUN
import axeron.prop
storm -rP "$bin" -s "${fun}" -fn "function" "$@"
sleep 1
storm -rP "$bin" -s "${onprop}" -fn "prop" "$@"
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

if [ $maintenance = "true" ]; then
   echo "======================="
   printer "  EXOGAME 1.0 BETA ON"
   echo "======================="
   exit 0
fi