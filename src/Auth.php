<?php

class Auth{

    const
    ADMIN = 1,
    BLOCK = '1',
    ATTEMPTS = 'attempts',
    MAX_ATTEMPTS = 10,
    LAST_LOGIN = 'lastlogin',
    TIME_MAX_ATTEMTS = 5,

    LOGIN_STATUS = 'loginStatus',
    USER_DATA = 'userData',
    //status codes
    UNDEFINED = 0,
    LOGIN_OK = 1,
    MAX_ATTEMPTS_REACHED = 2,
    BLOCKED = 3,
    WRONG_PASSWORD = 4;




    public static
    $userData = Array();

    private static

    $isAuthentificated = False,
    $personalData = Array(),
    $loginStatus = Auth::UNDEFINED;

    //pouzije session pre autentifikaciu
    public static function authentificate(){
        if(isset($_SESSION[Auth::LOGIN_STATUS])){
            if($_SESSION[Auth::LOGIN_STATUS]==Auth::LOGIN_OK){
                self::$loginStatus = Auth::LOGIN_OK;
                self::$userData = $_SESSION[Auth::USER_DATA];
            }
        }
    }

    //pouzije heslo na autentifikaciu
    public static function login( $password ){

        if(self::isAuth()){
            Viewer::addMessage('Pre prihlásenie sa musíš najskôr odhlásiť !',Viewer::INFO);
            Viewer::setPage(Viewer::TEST_LIST);
            return true;
        }

        //odstránime interpunkciu aby sme predišli SQL injection
        $password = Utils::rmBadCharacters($password);


        $row = DB::query("SELECT * FROM `login` WHERE `password`='".$password."'");
        //Utils::log($row);

        //ak prihlásenie prebehlo úspešne
        if($row->num_rows == 1){
            //vytiahneme data
            $data = $row->fetch_array();

            //ak je ucet zablokovany
            if($data['blocked']==Auth::BLOCK){
                Viewer::addMessage('Tento účet je zablokovaný !',Viewer::ERROR);
                self::$loginStatus = Auth::BLOCKED;
                Viewer::setPage(Viewer::LOGIN);
                return False;
            }

            //ak je prihlasenie uspesne
            //prihlasime
            Viewer::addMessage('Prihlásenie prebehlo úspešne !',Viewer::OK);
            self::$loginStatus = Auth::LOGIN_OK;
            //nastavíme udaje
            self::$userData['id'] = Array("id"=>$data["id"],"password"=>$password);
            self::$userData['trieda'] = DB::query("SELECT * FROM `triedy` WHERE `id`=".$data['trieda'])->fetch_array();
            if($data['admin']==Auth::ADMIN)
                self::$userData['admin'] = True;
            else
                self::$userData['admin'] = False;
            $_SESSION[Auth::USER_DATA]=self::$userData;
            $_SESSION[Auth::LOGIN_STATUS]=self::$loginStatus;


            return True;
        }
        //ak je zle heslo
        else{
            Viewer::addMessage('Zadal/a si zlé heslo !',Viewer::ERROR);

            $_SESSION[Auth::LAST_LOGIN]=time();
            self::$loginStatus = Auth::WRONG_PASSWORD;
            Viewer::setPage(Viewer::LOGIN);
            return False;
        }

    }

    public static function isAuth(){
        return self::$loginStatus==Auth::LOGIN_OK;
    }

    public static function isAdmin(){
        if(!isset(self::$userData['admin']))
            return 0;
        return self::$userData['admin'];
    }

    public static function getPersonalData(){
        return self::$personalData;
    }

    public static function getLoginStatus(){
        return self::$loginStatus;
    }


    public static function logout(){
        unset($_SESSION[Auth::LOGIN_STATUS]);
        unset($_SESSION[Auth::USER_DATA]);
        self::$loginStatus = Auth::UNDEFINED;
        Viewer::addMessage('Bol si úspešne odhlásený!',Viewer::OK);


    }


}





?>
