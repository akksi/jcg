<?php
/**
 * @version SVN: $Id$
 * @package    clarogames
 * @subpackage Views
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     David Bac {@link }
 * @author     Created on 29-Jun-2011
 * @license    GNU/GPL
 */

//-- No direct access
defined('_JEXEC') or die('Problemas generando la vista del componente clarogames');

jimport('joomla.application.component.view');

/**
 * HTML View class for the clarogames Component
 *
 * @package    clarogames
 */
class clarogamesViewclarogames extends JView
{
    function display($tpl = null)
    {
        $greeting = "Hello World!";
        $this->assignRef('greeting', $greeting);

        parent::display($tpl);
    }//function

}//class

class clarogamesViewGames extends JView{
    function display($tpl = null){
        $game_id = bin2hex(JRequest::getVar('game_id'));
        $greeting = "Hola mundo Games".hex2bin($game_id);
        $this->assignRef('greeting', $greeting);

        parent::display($tpl);
    }//function

}//class