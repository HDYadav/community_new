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


function pdf_group_color($colour = null)
{

        switch ($colour) {
                case ('0'):
                        $colour = 'background-color: #f2f8ee';
                        break;
                case ('1'):
                        $colour = 'background-color:#fff3ff';
                        break;
                case ('2'):
                        $colour = 'color:green;';
                        break;
                case ('3'):
                        $colour = 'color:red;';
                        break;
                default:
                        $colour = 'color:black;';
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

function getUserID($day_id, $city_id)
{
        $users = DB::table('schedulers as s')               
                ->where('s.days_id', $day_id)
                ->where('s.city_id', $city_id,)
                ->select('s.user_id')
                ->first();
        return  $users;
}


function getUserNameCityName($day_id)
{
        $users = DB::table('schedulers as s')
                ->join('cities as c','c.id','=','s.city_id')
                ->join('users as u', 'u.id', '=', 's.user_id')
                ->where('s.days_id', $day_id)
                ->select('c.name as city_name','u.name')
                ->get();
        return  $users;
}


function getSchedular($day_id)
{
        $users = DB::table('schedulers as s')
        ->join('cities as c', 'c.id', '=', 's.city_id')
        ->join('users as u', 'u.id', '=', 's.user_id')
        ->where('s.days_id', $day_id)
        ->select('c.name as city_name', 'u.name')
        ->get();
        return  $users;
}



