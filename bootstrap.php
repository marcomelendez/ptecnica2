<?php

require __DIR__. '/vendor/autoload.php';

use App\Models\Dependence;

function treeRepositories($value)
{
    $dependence = new Dependence();
    $repositories = [];
    $arrRepositories = $dependence->getAll($value);

    foreach($arrRepositories as $inx => $values){
        
        $repositories[$values['repository_main']][] = [
            'dependence'=>$values['repository_dependence'],
            'url_git'=>$values['url_git'],
            'parent'=>[]
        ];

        if($dependence->getAll($values['repository_parent'])){

            array_push($repositories[$values['repository_main']][$inx]['parent'],treeRepositories($values['repository_parent']));
        }
    }

    return $repositories;
}


print_r(treeRepositories(2));


