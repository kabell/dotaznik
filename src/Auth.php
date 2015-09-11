<?php

class Auth{

    const
      ADMIN = '1',
      BLOCK = '1',
      ATTEMPTS = 'attempts',
      MAX_ATTEMPTS = 10,
      LAST_LOGIN = 'lastlogin',
      TIME_MAX_ATTEMTS = 5,
      LOGIN_STATUS = 'loginstatus',
      LOGIN_ID = 'loginid',
      //status codes
      UNDEFINED = 0,
      LOGIN_OK = 1,
      MAX_ATTEMPTS_REACHED = 2,
      BLOCKED = 3,
      WRONG_PASSWORD = 4;





    private static
      $id = 0,
      $isAdmin = False,
      $isAuthentificated = False,
      $personalData = Array(),
      $loginStatus = Auth::UNDEFINED;

    //pouzije session pre autentifikaciu
    public static function authentificate(){
      if(isset($_SESSION[Auth::LOGIN_STATUS])){
        if($_SESSION[Auth::LOGIN_STATUS]==Auth::LOGIN_OK){
          self::$loginStatus = LOGIN_OK;
          self::$id = $_SESSION[Auth::LOGIN_ID];
        }
      }
    }

    //pouzije heslo na autentifikaciu
    public static function login( $password ){

      if(isset($_SESSION[Auth::LAST_LOGIN])){
        if($_SESSION[Auth::LAST_LOGIN]<time()-Auth::TIME_MAX_ATTEMTS)
          $_SESSION[Auth::ATTEMPTS]=0;
        }

      //skontrolujeme max pocet zlych prihlaseni
      if(isset($_SESSION[Auth::ATTEMPTS])){
        if($_SESSION[Auth::ATTEMPTS]>=Auth::MAX_ATTEMPTS){
          self::$loginStatus = Auth::MAX_ATTEMPTS_REACHED;
          return false;
        }
      }

      //odstránime interpunkciu aby sme predišli SQL injection
      $password = Utils::rmBadCharacters($password);


      $row = DB::query("SELECT * FROM `login` WHERE `password`='".$password."'");

      //ak prihlásenie prebehlo úspešne
      if($row->num_rows == 1){
        //vytiahneme data
        $data = $row->fetch_array();

        //ak je ucet zablokovany
        if($data['blocked']==Auth::BLOCK){
          self::$loginStatus = Auth::BLOCKED;
          return False;
        }

        //ak je prihlasenie uspesne
        //prihlasime
        self::$loginStatus = Auth::LOGIN_OK;
        //nastavíme udaje
        self::$id = $data["id"];
        if($data['admin']==Auth::ADMIN)
          self::$isAdmin = True;

        return True;
      }
      //ak je zle heslo
      else{
        //zvysime pocet zlych prihlaseni
        if(isset($_SESSION[Auth::ATTEMPTS]))
          $_SESSION[Auth::ATTEMPTS]+=1;
        else
          $_SESSION[Auth::ATTEMPTS]=1;

        $_SESSION[Auth::LAST_LOGIN]=time();
        self::$loginStatus = Auth::WRONG_PASSWORD;

        return False;
      }

    }

    public static function isAuth(){
      return self::$loginStatus==Auth::LOGIN_OK;
    }

    public static function isAdmin(){
      return self::$isAdmin;
    }

    public static function getPersonalData(){
      return self::$personalData;
    }

    public static function getLoginStatus(){
      return self::$loginStatus;
    }

    public static function logout(){
      unset($_SESSION[Auth::LOGIN_STATUS]);
      unset($_SESSION[Auth::LOGIN_ID]);
      self::$loginStatus = Auth::UNDEFINED;
      self::$id = 0;
    }


}





 ?>
