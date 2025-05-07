<?php
class Account extends Controller
{
    function GetAccount()
    {
        $id = $_GET['id'];
        if (isset($id)) {
            $account = $this->model("AccountModel")->GetAccountByID($id);
            if ($account) {
                echo json_encode($account);
            } else {
                echo json_encode(array("error" => "Account not found"));
            }
        } else {
            echo json_encode(array("error" => "ID not provided"));
        }
    }
}
