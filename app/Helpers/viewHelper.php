<?php

use Illuminate\Support\Facades\DB;

function group_color($colour=null)
{

        switch ($colour) {
                case ('0'):
                        $colour ='color:brown;';
                        break; 
                case ('1'):
                        $colour ='color:blue;';
                        break;
                case ('2'):
                        $colour ='color:green;';
                        break;
                case ('3'):
                        $colour ='color:red;';
                        break;
                default:
                $colour ='color:black;';
        }

    return $colour;
}

function getUsers()
        {
                $users = DB::table('users as u')
                ->join('model_has_roles as mhr', 'mhr.model_id', '=', 'u.id')
                ->join('roles as r', 'r.id', '=', 'mhr.role_id')
                ->where('r.name', 'message giver')
                ->select('u.id', 'u.name') 
                ->get(); 
                return  $users;
                 
        }


