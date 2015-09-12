<?php

class Utils{

    private static
      $log = "";

    public static function rmBadCharacters($string){
      return $string;
    }

    public static function myErrorHandler($errno, $errstr, $errfile, $errline)
    {
        if (!(error_reporting() & $errno)) {
            // This error code is not included in error_reporting
            return;
        }

        switch ($errno) {
        case E_USER_ERROR:
            self::log("<div class=\"alert alert-danger\"><b>My ERROR</b> [$errno] $errstr");
            self::log("  Fatal error on line $errline in file $errfile</div>");
            echo self::getLog();
            exit(0);
            break;

        case E_USER_WARNING:
            self::log("<div class=\"alert alert-warning\"><b>My WARNING</b> [$errno] $errstr</div>");
            break;

        case E_USER_NOTICE:
            self::log("<div class=\"alert alert-info\"><b>My NOTICE</b> [$errno] $errstr</div>");
            break;

        default:
            self::log("<div class=\"alert alert-info\">Unknown error type: [$errno] $errstr</div>");
            break;
        }

        /* Don't execute PHP internal error handler */
        return true;
    }

    public static function log($message){
      self::$log.=$message."\n";
      //echo str_replace("\n","<br/>\n",$message);
    }
    public static function getLog(){
      self::$log = str_replace("\n","<br/>\n",self::$log);
      return self::$log;
    }


}




 ?>
