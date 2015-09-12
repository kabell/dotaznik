<?php

class Test{

    public static
    $tasks,
    $testData;

    private static
        $testLoaded = False;

    //inicializuje test
    public static function init(){

        //overi spravnost testu
        if(!self::over()){
            Viewer::addMessage("Prepáč, na tento test nemáš oprávnenie !",Viewer::ERROR);
            return;
        }

        //nacita test
        self::loadTasks();
    }

    public static function submit(){
        //overi spravnost testu
        if(!self::over()){
            Viewer::addMessage("Prepáč, na tento test nemáš oprávnenie !",Viewer::ERROR);
            return ;
        }

        //nacita test
        self::loadTasks();

        //spracuje test
        $testid=self::$testData['testid'];

        $answers = Array();


        $sucet = 0;
        if(count(self::$tasks)==0){
            Viewer::addMessage("Prepáč, ale teraz niesu pre teba k dispozícii žiadne otázky !",Viewer::ERROR);
        }
        foreach(self::$tasks as $task){
            if(isset($_POST['task'.$task['id']])){
                $answer = $_POST['task'.$task['id']];
                $answer = self::checkAnswer($answer);
                if($answer==$task['expected'])
                    $sucet+=2;
                else if($answer==3)
                    $sucet+=1;
            }
            else $sucet+=1;

        }

        //DB::query("insert into stats (testid, value, time) values ('".$testid."','".$sucet."','".time()."')");
        DB::query("insert into `answered` (testid,userid,score,time) values ('".$testid."','".Auth::$userData['id']['id']."','".$sucet."','".time()."') ");
        TestList::init();
        Viewer::setPage(Viewer::TEST_LIST);

    }



    private static function over(){
        //ak niesom prihlaseny tak ma prihlas
        if(!Auth::isAuth()){
            Viewer::addMessage("Na zobrazenie tejto stránky musíš byť prihlásený/á !",Viewer::ERROR);
            Viewer::setPage(Viewer::LOGIN);
            return False;
        }
        //zistim si cislo pozadovaneho testu
        $testid=0;
        if(isset($_GET['testid'])){
            $testid=intval($_GET['testid']);
        }

        //overim ci exituje taky test pre mna
        $query = DB::query('SELECT * from `ucitelia` LEFT JOIN `tests`ON ucitelia.ucitelid=tests.ucitel WHERE `testid`='.$testid);
        //ak nie
        if($query->num_rows==0){
            //idem s5 na zoznam testov
            Viewer::addMessage("Takýto dotazník neexistuje!",Viewer::ERROR);
            TestList::init();
            Viewer::setPage(Viewer::TEST_LIST);
            return False;
        }

        //overim ci tento test neije vyplneny
        $queryans = DB::query('SELECT * from `answered` WHERE `testid`='.$testid." AND `userid`=".Auth::$userData['id']['id']);
        if($queryans->num_rows != 0){
            Viewer::addMessage("Tento dotazník si už vyplnil/a!",Viewer::ERROR);
            TestList::init();
            Viewer::setPage(Viewer::TEST_LIST);
            return False;
        }

        //ulozim si udaje o teste
        self::$testData = $query->fetch_array();
        return True;

    }

    //nacitam info o teste a zoznam otazok
    private static function loadTasks(){
        if(self::$testLoaded==True)
            return;
        self::$testLoaded = True;

        $query = DB::query("select * from tasks");
        while($task = $query->fetch_array()){
            self::$tasks[]= $task;
        }
    }

    private static function checkAnswer($answer){
        $answer = intval($answer);
        if($answer>=1 && $answer<=3)
            return $answer;
        return 3;
    }


}









?>
