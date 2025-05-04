<?php
class Home extends Controller
{
    function Sayhi()
    {
        $this->view("admin/Login", []);
    }
}
