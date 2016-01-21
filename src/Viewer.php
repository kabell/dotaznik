<?php

class Viewer{

    const
    //pages
    //DEFAULT = 'index.html',
    NOT_FOUND_404 = '404',
    LOGIN = 'login',
    TEST_LIST = 'test_list',
    TEST = 'test',
    ADMIN = 'admin',
    STATS = 'stats',

    //modes
    MODE_LOGIN = 'login',
    MODE_LOGOUT = 'logout',
    MODE_SHOW_LIST = 'show_list',
    MODE_SHOW_TEST = 'show_test',
    MODE_SUBMIT_TEST = 'submit_test',
    MODE_DEL_PREDMET = 'delpredmet',
    MODE_ADD_CLASS = 'addclass',
    MODE_DEL_CLASS = 'delclass',
    MODE_ADD_PREDMET = 'addpredmet',


    //messages
    OK = 0,
    INFO = 1,
    WARNING = 2,
    ERROR = 3;


    private static
    $page = Viewer::LOGIN,
    $messages = Array();

    public static function setPage($page){
        if($page == self::NOT_FOUND_404 || $page == self::LOGIN || ($page == self::TEST_LIST && Auth::isAuth()) || ($page == self::TEST && Auth::isAuth()) || ($page == self::STATS && Auth::isAdmin()) || ($page == self::ADMIN && Auth::isAdmin()))
            self::$page = $page;
    }

    public static function getPage(){
        return self::$page;
    }

    public static function addMessage($message,$type=self::ERROR){
        self::$messages[]=Array("type"=>$type,"text"=>$message);
    }

    public static function messages(){
        //pridam filtrovanie wwarningy, errory atd.
        return self::$messages;
    }

    public static function run(){
        if(isset($_GET['mode']))
            $mode = $_GET['mode'];
        else
            $mode = "";
        $request = True;

        //najskôr vyriadime požiadavku
        if($mode == self::MODE_LOGIN && isset($_POST['password']))
            Auth::login($_POST['password']);
        else if($mode == self::MODE_SUBMIT_TEST){
            if(Auth::isAuth())          Test::submit();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }
        else if($mode == self::MODE_LOGOUT){
            if(Auth::isAuth())          Auth::logout();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }
        else if($mode == self::MODE_DEL_PREDMET){
            if(Auth::isAdmin())         Admin::delPredmet();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }
        else if($mode == self::MODE_ADD_CLASS){
            if(Auth::isAdmin())         Admin::addClass();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }
        else if($mode == self::MODE_DEL_CLASS){
            if(Auth::isAdmin())         Admin::delClass();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }
        else if($mode == self::MODE_ADD_PREDMET){
            if(Auth::isAuth())          Admin::addPredmet();
            else                        Viewer::addMessage("Na túto akciu nemáš prístup !",Viewer::ERROR);
        }

        //a idem spracovť stránku

        //ak som prihlásený a chcem sa znova prihlásiť tak mi to nepojde
        if(self::$page==self::LOGIN && Auth::isAuth())
            Viewer::setPage(self::TEST_LIST);

        if(self::$page == self::TEST_LIST)
        TestList::init();
        else if (self::$page == self::TEST)
        Test::init();
        else if (self::$page == self::STATS)
        Stats::init();
        else if (self::$page == self::ADMIN)
        Admin::init();

    }


}





?>
