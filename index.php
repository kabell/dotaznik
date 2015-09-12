<?php
include 'src/Utils.php';
set_error_handler("Utils::myErrorHandler");
include 'settings.php';
include 'src/Dotaznik.php';
include 'src/Viewer.php';

DOT::debug(False);

DOT::initialize();
#DOT::run();
include 'html/'.Viewer::getPage().".html";


?>
