<?php

class DB {

    private static
    $db;

    public static function connect(){
        //skusime sa pripojit
        self::$db = new mysqli(Settings::$dbHost, Settings::$dbUser, Settings::$dbPassword, Settings::$dbDatabase);

        //ak nastala chyba
        if (self::$db->connect_error) {
            Viewer::addMessage("Nepodarilo sa pripojiť k databáze, prosím kontaktujte administrátora !",Viewer::ERROR);
            Utils::log('Connect Error (' . self::$db->connect_errno . ') '. self::$db->connect_error);
            return False;
        }
        //nastavime charset
        self::$db->set_charset("utf8");
        return True;
    }

    public static function query($sql){
        Utils::log($sql);
        $res =  self::$db->query($sql);
        if($res == FALSE){
            Utils::log("Error");
            Viewer::addMessage("Nastala chyba pri komunikácii s databázou, prosím kontaktuj administrátora !",Viewer::ERROR);
        }
        return $res;
    }

    public static function close(){
        self::$db->close();
    }

}


?>
