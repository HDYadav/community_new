<?php

namespace App\Repository;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Helpers\UserData;



class SchedulerRepository
{

    public function getYears()
    {
        return  DB::table('years')->select('id', 'year')->orderBy('id', 'ASC')->get();
    }

    public function getMonths($request)
    {
        return  DB::table('days as d')
            ->join('months as m', 'm.id', '=', 'd.month_id')
            ->where('d.year_id', $request->year_id)
            ->select('m.id', 'm.month')
            ->orderBy('d.id', 'ASC')
            ->groupBy('d.month_id')
            ->get();
    }


    public function getCities()
    {
        return DB::table('cities')->select('id', 'name as city_name')->orderBy('id', 'ASC')->get();
    }

    public function getUsers()
    {
        $users = DB::table('users as u')
            ->join('model_has_roles as mhr', 'mhr.model_id', '=', 'u.id')
            ->join('roles as r', 'r.id', '=', 'mhr.role_id')
            ->where('r.name', 'message giver')
            ->select('u.id', 'u.name');

        return $users->get();
    }


    public function getSchedules()
    {
        $scheduler = DB::table('schedulers as s')
                ->join('days as d', 'd.id', '=', 's.days_id')           
                ->join('cities as c', 'c.id', '=', 's.city_id')
                ->join('users as u', 'u.id', '=', 's.user_id')
                ->orderBy('s.id','DESC')
                ->select('d.id','s.id as sid', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date'), 'd.day', 'c.name as city_name', 'u.name','s.city_id');

        return $scheduler->get();
    }


    public function scheduler($id)
    {
        $scheduler = DB::table('schedulers as s')
        ->where('s.days_id', $id)
        ->join('days as d', 'd.id', '=', 's.days_id')
        ->join('cities as c', 'c.id', '=', 's.city_id')
        ->join('users as u', 'u.id', '=', 's.user_id')        
        ->orderBy('s.id', 'DESC')
        ->select('d.id', 's.days_id','s.user_id', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date'), 'd.day', 'c.name as city_name', 'u.name', 's.city_id','d.month_id','d.year_id');

        return $scheduler->get();
    }

    public function monthList()
    {
        return  DB::table('days as d')
        ->join('months as m', 'm.id', '=', 'd.month_id')
            ->select('m.id', 'm.month')
            ->orderBy('d.id', 'ASC')
            ->groupBy('d.month_id')
            ->get();
    }


}
