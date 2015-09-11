<?php

class DB {

    private static
      $db;

    public static function connect(){
      self::$db = new mysqli(Settings::$dbHost, Settings::$dbUser, Settings::$dbPassword, Settings::$dbDatabase);
    }

    public static function query($sql){
      echo $sql."<br>";
      $res =  self::$db->query($sql);
      if($res == FALSE)
        echo "Error<br>";
      return $res;
    }

    public static function close(){
      self::$db->close();
    }

}


 ?>
