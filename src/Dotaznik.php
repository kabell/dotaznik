<?php
include 'Utils.php';
include 'DB.php';
include 'Auth.php';

class DOT {

  private static
      $paths;


  public static function initialize(){

    setlocale(LC_ALL, "sk_SK.utf8"); 
    header("Content-Type: text/html; charset=utf-8"); 
    date_default_timezone_set("Europe/Bratislava"); 

    self::$paths["this"] = $_SERVER["SCRIPT_FILENAME"];
    self::$paths["root"] = getcwd(); 
    session_start();
    DB::connect();
    //Auth::logout();
    //$_SESSION[Auth::ATTEMPTS]=0;
    Auth::login('123456');
    //Auth::authentificate();

    echo "Login status: ".Auth::getLoginStatus()."<br>";
    echo "attemts: ".$_SESSION[Auth::ATTEMPTS]."<br>";


  }







}




 ?>
