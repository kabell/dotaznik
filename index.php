<?php
error_reporting(E_ALL);
$startTime = microtime(True);
include 'src/Utils.php';
//set_error_handler("Utils::myErrorHandler");
include 'settings.php';
include 'src/Dotaznik.php';
include 'src/Viewer.php';

DOT::debug(False);

DOT::initialize();
#DOT::run();
$endTime = microtime(True);
include 'html/'.Viewer::getPage().".html";


?>
