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

    //modes
    MODE_LOGIN = 'login',
    MODE_LOGOUT = 'logout',
    MODE_SHOW_LIST = 'show_list',
    MODE_SHOW_TEST = 'show_test',
    MODE_SUBMIT_TEST = 'submit_test',

    //messages
    OK = 0,
    INFO = 1,
    WARNING = 2,
    ERROR = 3;


    private static
      $page = Viewer::TEST_LIST,
      $messages = Array();

    public static function setPage($page){
      if($page == self::NOT_FOUND_404 || $page == self::LOGIN || $page == self::TEST_LIST || $page == self::TEST)
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
      if($mode == self::MODE_LOGIN)
        Auth::login($_POST['password']);
      else if($mode == self::MODE_SUBMIT_TEST)
        Test::submit();
      else if($mode == self::MODE_LOGOUT)
        Auth::logout();

      if(self::$page == self::TEST_LIST)
        TestList::init();
      else if (self::$page == self::TEST)
        Test::init();
    }


}





 ?>
