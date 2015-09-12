<?php

include 'DB.php';
include 'Auth.php';
include 'TestList.php';
include 'Test.php';

class DOT {

    public static
    $debug;

    private static
    $log="",
    $paths;


    public static function initialize(){

        setlocale(LC_ALL, "sk_SK.utf8");
        header("Content-Type: text/html; charset=utf-8");
        date_default_timezone_set("Europe/Bratislava");

        self::$paths["this"] = $_SERVER["SCRIPT_FILENAME"];
        self::$paths["root"] = getcwd();

        session_start();
        //pripojime sa do databaazy
        DB::connect();

        //autentizujeme pouzivatela so session
        Auth::authentificate();

        //ak uzivatel pozaduje nejaky stranku tak ju nastavime ako predvolenu
        if(isset($_GET['page'])){
            Viewer::setPage($_GET['page']);
        }

        //spustime spracovanie stránky
        Viewer::run();

        //s logom to doriešim neskôr
        //echo Utils::getLog();
    }

    //nastavi debug režim
    public static function debug($value){
        self::$debug=$value;
    }









}




?>
