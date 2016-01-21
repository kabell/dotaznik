<?php
 class Stats{

     public static
     $predmety = Array(),
     $ucitelia = Array(),
     $triedy = Array(),
     $tests = Array(),
     $celkovo = Array(),
     $ucitelia_spolu = Array(),
     $triedy_spolu = Array(),
     $ucitelia_triedy = Array(),
     $triedy_ucitelia = Array();

     private static
     $grafid = 1;


     public static function init(){

         $predmety = Array();
         $triedy = Array();
         $ucitelia = Array();

         $query = DB::query("SELECT * FROM `predmety`");
         while($query->num_rows > 0 && $res = $query->fetch_array()){
             $predmety[$res['nazov']]=$res;
         }

         $query = DB::query("SELECT * FROM `ucitelia`");
         while($query->num_rows > 0 && $res = $query->fetch_array()){
             $ucitelia[$res['meno']]=Array();
         }

         $query = DB::query("SELECT * FROM `triedy` where blocked=0");
         while($query->num_rows > 0 && $res = $query->fetch_array()){
             $triedy[$res['name']]=Array();
         }



         $data = Array();

         $query = DB::query("SELECT * FROM `answered`
              JOIN `tests` ON answered.testid=tests.testid
              JOIN `ucitelia` ON tests.ucitel=ucitelia.ucitelid
              JOIN `triedy` ON tests.trieda=triedy.id
              JOIN `predmety` ON predmety.predmetid=tests.predmetid");

         while($query->num_rows > 0 && $res = $query->fetch_array()){
             $data[]=$res;
         }



         foreach($data as $value){
             $ucitelia[$value['meno']][$value['name']][]=$value['score'];
             $triedy[$value['name']][$value['meno']][]=$value['score'];
         }
         foreach($ucitelia as $ucitel=>$triedyd){
             $sucet = 0;
             $pocet = 0;
             foreach($triedyd as $trieda=>$value){
                 $sucet_trieda = 0;
                 $pocet_trieda = 0;

                 foreach($value as $score){
                     $pocet_trieda++;
                     $sucet_trieda+=$score;

                 }
                 self::$ucitelia_triedy[$ucitel][$trieda]=intval($sucet_trieda/max(1,$pocet_trieda));
                 $sucet+=$sucet_trieda;
                 $pocet+=$pocet_trieda;

             }
             self::$ucitelia_spolu[$ucitel]=intval($sucet/max(1,$pocet));
         }

         foreach($triedy as $trieda=>$uciteliad){
             $sucet = 0;
             $pocet = 0;
             foreach($uciteliad as $ucitel=>$value){
                 $sucet_ucitel = 0;
                 $pocet_ucitel = 0;

                 foreach($value as $score){
                     $pocet_ucitel++;
                     $sucet_ucitel+=$score;

                 }
                 self::$triedy_ucitelia[$trieda][$ucitel]=intval($sucet_ucitel/max(1,$pocet_ucitel));
                 $sucet+=$sucet_ucitel;
                 $pocet+=$pocet_ucitel;

             }
             self::$triedy_spolu[$trieda]=intval($sucet/max(1,$pocet));
         }



         //print_r(self::$ucitelia_triedy);

     }

     private static function labels($data){
         $string = "";
         foreach($data as $key=>$value)
         $string.='"'.$key.'",';
          return $string;

     }
     private static function values($data){
         $string = "";
         foreach($data as $key=>$value)
         $string.='"'.intval($value/(1.2)).'",';
          return $string;
     }

     public static function chart($name,$data,$width=50){
         if(count($data)==0)
         return "";
         $return ="<h2>".$name."</h2>
         <div style=\"width: ".$width."%\">
             <canvas id=\"chart".self::$grafid."\" height=\"400\" width=\"600\"></canvas>
         </div>
         <script>
        var chart".self::$grafid."  = {

            labels : [".self::labels($data)."],
            datasets : [
                {
                    tooltipFillColor: \"rgba(150,150,150,0.8)\",
                    fillColor : \"rgba(151,187,205,0.5)\",
                    strokeColor : \"rgba(151,187,205,0.8)\",
                    highlightFill : \"rgba(151,187,205,0.75)\",
                    highlightStroke : \"rgba(151,187,205,1)\",
                    data : [".self::values($data)."]
                }
            ]
        }
            var ctx = document.getElementById(\"chart".self::$grafid."\").getContext(\"2d\");
            window.myBar = new Chart(ctx).Bar(chart".self::$grafid.", {
                responsive : true
            });
        </script>\n";
    self::$grafid++;
    return $return;
    }




}

?>
