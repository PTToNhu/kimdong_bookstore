<?php
class RelatedNewModel extends Database
{
    public function getRelatedNewsByNewID($newID)
    {
        $query = "SELECT `ID`, `Title` from `news` where `Status`=1 HAVING `ID` IN (SELECT `RelatedNewID` FROM `relatednew` WHERE newid=$newID);";
        return mysqli_query($this->connection, $query);
    }
}
