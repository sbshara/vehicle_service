<?php

defined('DS')       ?       null    :   define('DS', DIRECTORY_SEPARATOR);
defined('SIT_ROT')  ?       null    :   define('SIT_ROT', dirname(__FILE__));

defined('INC_DIR')  ?       null    :   define('INC_DIR', SIT_ROT.DS.'includes');
defined('DSB_DIR')  ?       null    :   define('DSB_DIR', SIT_ROT.DS.'db');

require_once(INC_DIR.DS.'config.php');
require_once(INC_DIR.DS.'funcs.php');
require_once(INC_DIR.DS.'valid_funcs.php');


require_once(INC_DIR.DS.'database.php');
require_once(INC_DIR.DS.'databaseobject.php');
require_once(INC_DIR.DS.'logger.php');
require_once(INC_DIR.DS.'page.php');


require_once(INC_DIR.DS.'session.php');
require_once(INC_DIR.DS.'comment.php');
require_once(INC_DIR.DS.'mfunction.php');
require_once(INC_DIR.DS.'mileage.php');
require_once(INC_DIR.DS.'module.php');
require_once(INC_DIR.DS.'photograph.php');
require_once(INC_DIR.DS.'service.php');
require_once(INC_DIR.DS.'truck.php');
require_once(INC_DIR.DS.'user.php');
require_once(INC_DIR.DS.'usergroup.php');
require_once(INC_DIR.DS.'interval.php');
require_once(INC_DIR.DS.'category.php');



?>
