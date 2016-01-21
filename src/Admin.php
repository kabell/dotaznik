<?php

class Admin{

  private static $initialized = False;

  public static $triedy = Array(),
                $triedy_predmety = Array(),
                $ucitelia = Array(),
                $predmety = Array();



  public static function init() {

    if(self::$initialized == True)
    return;
    self::$initialized = True;


    //ak niesom prihlaseny tak ma hod na login
    if(!Auth::isAuth()){
        Viewer::addMessage("Na zobrazenie tejto stránky musíš byť prihlásený/á !",Viewer::ERROR);
        Viewer::setPage(Viewer::LOGIN);
        return;
    }
    //ak nie som admin (ale som prihlaseny), tak ma hod na TestList
    /*
    if(!Auth::isAdmin()) {
      Viewer::addMessage("Na zobrazenie tejto stránky musíš byť adminstrátor !", Viewer::ERROR);
      TestList::init();
      Viewer::setPage(Viewer::TEST_LIST);
      return;
    }
    */
    //vytiahnem predmety
    $query = DB::query("SELECT * FROM `predmety` ORDER BY nazov");
    while($row = $query->fetch_array()){
        self::$predmety[]=$row;
    }

    //vytiahnem triedy
    $query = DB::query("SELECT * FROM `triedy` WHERE blocked=0 ORDER BY id");
    while($row = $query->fetch_array()){
        self::$triedy[]=$row;
        self::$triedy_predmety[$row['name']]=Array();
    }

    //vytiahnem ucitelov
    $query = DB::query("SELECT * FROM `ucitelia`");
    while($row = $query->fetch_array())
        self::$ucitelia[]=$row;

    //vytiahnem vsetky testy
    $query = DB::query("SELECT * FROM tests
         JOIN ucitelia ON ucitelia.ucitelid=tests.ucitel
         JOIN triedy ON triedy.id=tests.trieda
         JOIN predmety ON predmety.predmetid=tests.predmetid
         WHERE blocked=0 AND removed=0");

    while($row = $query->fetch_array()){

        self::$triedy_predmety[$row['name']][]=$row;
    }

  }

  public static function delPredmet(){
      $id=intval($_GET['id']);

      DB::query("UPDATE `tests` SET removed=1 WHERE testid=".$id);
      Viewer::addMessage("Predmet bol úspešne zmazaný !",Viewer::OK);
  }

  public static function delClass(){
      $id=intval($_GET['id']);

      DB::query("UPDATE `triedy` SET blocked=1 WHERE id=".$id);
      Viewer::addMessage("Trieda bola úspešne zmazaná !",Viewer::OK);
  }

  public static function addClass(){
      $name=Utils::rmBadCharacters($_POST['classname']);

      DB::query("INSERT INTO triedy (name) VALUES ('".$name."')");
      Viewer::addMessage("Trieda bola úspešne vytvorená !",Viewer::OK);
  }

  public static function addPredmet(){
      $id=intval($_GET['id']);
      $predmetid=intval($_POST['predmetid']);
      $ucitel=intval($_POST['ucitel']);


      DB::query("INSERT INTO `tests` (trieda,predmetid,ucitel) VALUES ('".$id."','".$predmetid."','".$ucitel."')");
      Viewer::addMessage("Predmet bot úspešne pridaný !",Viewer::OK);
  }


}





?>
