<?php

class Utils{

    private static
      $log = "";

    public static function rmBadCharacters($string){
      return $string;
    }

    public static function log($message){
      self::$log.=date("Y-m-d H:m:s")." ".print_r($message,True)."\n";
      //echo str_replace("\n","<br/>\n",$message);
    }
    public static function getLog(){
      //self::$log = str_replace("\n","<br/>\n",self::$log);
      return self::$log;
    }


}




 ?>
