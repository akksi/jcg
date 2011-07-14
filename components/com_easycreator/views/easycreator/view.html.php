<?php
/**
 * @version SVN: $Id: view.html.php 1108 2010-02-22 17:20:47Z elkuku $
 * @package    EasyCreator
 * @subpackage Frontent
 * @author     EasyJoomla {@link http://www.easy-joomla.org Easy-Joomla.org}
 * @author     Nikolai Plath (elkuku) {@link http://www.nik-it.de NiK-IT.de}
 * @author     Created on 24-Sep-2008
 */

//-- No direct access
defined('_JEXEC') or die('=;)');

jimport( 'joomla.application.component.view');

/**
 * HTML View class for the Schleimi Component.
 *
 * @package    EasyCreator
 * @subpackage Frontent
 */
class EasyCreatorViewEasyCreator extends JView
{
    /**
     * EasyCreator view display method.
     *
     **/
    function display($tpl = null)
    {
        //--get vars from request
        $selectedProject = JRequest::getVar('ebc_project', '');

        if( $selectedProject)
        {
            echo '<strong>'.$selectedProject.'</strong><hr />';
            $prefix = substr($selectedProject,0,3);
            switch( $prefix )
            {
                case 'com':
                    $this->setLayout('component');
                    break;

                case 'mod':
                    $this->setLayout('module');
                    break;

                default:
                    echo '<h3 style="color: blue;">not yet...</h3>';
                    echo 'render: '.$selectedProject;
                    break;
            }//switch
        }

        $this->assignRef( 'selectedProject', $selectedProject );

        parent::display($tpl);
    }//function

}//class
