<?php
class clarogamesViewclarogames extends JView
{
    function display($tpl = null)
    {
        $greeting = "Hello World!";
        $this->assignRef('greeting', $greeting);

        parent::display($tpl);
    }//function

}//class

$TPP_CF=new TPP_CF();
$TPP_CF->is_logged();
?>