<?php
class App{

    protected $controller="home";
    protected $action="sayhi";
    protected $params=[];

    function __construct(){
        $arr=$this->UrlProcess();

        if(!empty($arr) && file_exists("./mvc/controllers/".$arr[0].".php")  ){
            $this->controller=$arr[0];
            unset($arr[0]);
        }
        require_once "./mvc/controllers/". $this->controller.".php";

        if (!empty($arr) && isset($arr[1])){
            if( method_exists($this->controller, $arr[1]) ){
                $this->action=$arr[1];
            }
            unset($arr[1]);
        }
        $this->params=$arr?array_values($arr):[];

        call_user_func_array([new $this->controller, $this->action], $this->params);
    }
    function UrlProcess(){
        if (isset($_GET["url"])){
            return explode("/", filter_var(trim($_GET["url"], "/")));
        }
    }
}
?>