<?php

class TestList{

    const
    UNANSWERED = 0,
    ANSWERED = 1,
    CANCELED = 2;



    public static
    $allTests=Array(),
    $answeredTests=Array();

    private static
    $initialized = False;


    public static function init(){

        if(self::$initialized == True)
        return;
        self::$initialized = True;


        //ak niesom prihlaseny tak ma hod na login
        if(!Auth::isAuth()){
            Viewer::addMessage("Na zobrazenie tejto stránky musíš byť prihlásený/á !",Viewer::ERROR);
            Viewer::setPage(Viewer::LOGIN);
            return;
        }
        //nacitam z DB vsetky dotazniky ktore su pre mna
        $query = DB::query('SELECT * from `ucitelia`
             LEFT JOIN `tests` ON ucitelia.ucitelid=tests.ucitel
             LEFT JOIN `predmety` ON predmety.predmetid=tests.predmetid
         WHERE `trieda`='.Auth::$userData['trieda']['id']);

        //ak ich je 0
        //if($query->num_rows==0)
        //    Viewer::addMessage("Prepáč, ale teraz niesu pre teba k dispozícii žiadne dotazníky !",Viewer::ERROR);

        //ulozim si ich
        while($query->num_rows>0 && $row = $query->fetch_array()){
            self::$allTests[]=$row;
        }

        //tuto treba odfiltrovat zodpovedane testy
        //nacitam ich zoznam z DB
        $query = DB::query("SELECT * from `answered` where `userid`=".Auth::$userData['id']['id']);
        $answered = Array();
        while($query->num_rows>0 && $row = $query->fetch_array()){
            $answered[]=$row;
        }
        //oznacim zodpovedane
        foreach(self::$allTests as &$test){
            if(isset($test['answered'])) {
                continue;
            }
            $found = False;
            foreach ($answered as $answer){
                if($answer['testid']==$test['testid'])
                $found = True;
            }
            // ak je zodpovedany, zodpovedane su aj vsetky s rovnakym groupid
            if($found) {
                foreach(self::$allTests as &$test2) {
                    //zapnutie skupin  - prepisanie testid na groupid
                    if(strcmp($test['testid'], $test2['testid'])==0) {
                        $test2['answered'] = True;
                    }
                }
            }
            else {
                $test['answered']=False;
            }
        }
        //Utils::log(print_r(self::$allTests,true));

        //skontrolujeme kolko dotaznikov este zostava

        $counter = 0;
        foreach(self::$allTests as &$test){
            if($test['answered']==False)
            $counter++;
        }

        if($counter==0 && count(self::$allTests)>0)
        Viewer::addMessage("Ďakujeme za vyplnenie všetkých dotazníkov !",Viewer::OK);
        else{
        Viewer::addMessage("Ešte ti zostáva ".$counter." dotazníkov.",Viewer::WARNING);
        }
        //Utils::log(print_r(self::$allTests,true));

        //Utils::log(print_r(self::$allTests,true));

    }






}


?>
