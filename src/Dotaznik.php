<?php

include 'DB.php';
include 'Admin.php';
include 'Auth.php';
include 'Stats.php';
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

        //zapiseme do logu vstupne premenne
        Utils::log($_GET);
        Utils::log($_POST);

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
        file_put_contents(self::$paths["root"]."/".Settings::$logFile, Utils::getLog(), FILE_APPEND | LOCK_EX);

    }

    //nastavi debug režim
    public static function debug($value){
        self::$debug=$value;
    }









}




?>
