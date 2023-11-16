<?php

namespace App\Repository;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Helpers\UserData;
use App\Models\Scheduler; 

class SchedulerRepository
{

    public function getYears()
    {
        return  DB::table('years')->select('id', 'year')->orderBy('id', 'ASC')->get();
    }

    public function getMonths($request)
    {  
        $query =    DB::table('days as d')                              
                    ->join('months as m', 'm.id', '=', 'd.month_id')
                    ->where('d.year_id', $request->year_id)
                   // ->whereNotIn('d.month_id', $month_ids) 
                    ->orderBy('d.id', 'DESC')
                    ->groupBy('d.month_id', 'm.id', 'm.month')  
                    ->select('m.id', 'm.month')
                    ->get();

      return $query;

    }


    public function getAllMonths($request)
    {
        $query =    DB::table('days as d')
            ->join('months as m', 'm.id', '=', 'd.month_id')
            ->where('d.year_id', $request->year_id)            
            ->orderBy('d.id', 'ASC')
            ->groupBy('d.month_id', 'm.id', 'm.month')
            ->select('m.id', 'm.month')
            ->get();

        return $query;
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
                ->where('s.status', Scheduler::STATUS_PUBLISHED)
                ->orderBy('d.date','ASC')
                ->select('d.id','s.id as sid', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date'), 'd.day', 'c.name as city_name', 'u.name','s.city_id');

        return $scheduler->get();
    }

    public function getSchedulesDraft()
    {
        $scheduler = DB::table('schedulers as s')
                    ->join('days as d', 'd.id', '=', 's.days_id')
                    ->join('cities as c', 'c.id', '=', 's.city_id')
                    ->join('users as u', 'u.id', '=', 's.user_id')
                    ->where('s.status', Scheduler::STATUS_DRAFT)
                    ->select('d.id', 's.id as sid', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date'), 'd.day', 'c.name as city_name', 'u.name', 's.city_id');

        return $scheduler->get();
    }


    public function getMonthIdYearID($days_id){
         $details = DB::table('days as d')
                ->where('d.id', $days_id)
                ->select('d.year_id','d.month_id');
                return $details->get(); 
    }

    public function getAllDaysByMonth($month_id, $year_id){
        return DB::table('days as d')
            ->join('months as m', 'm.id', '=', 'd.month_id')
            ->where('d.month_id', $month_id)
            ->where('d.year_id', $year_id)
            ->select('d.id', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date'),'m.month')
            ->get(); 
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

    public function checkDuplicate($days_id, $member_id, $locaion_id){

        if (Scheduler::where('days_id', '=', $days_id)->where('user_id', '=', $member_id)->where('city_id', '=', $locaion_id)->exists()) {
           return 0;
        }else{
            return 1;
        }

    }


    public function getDaysMonthYear($request)
    {
       return DB::table('days as d')
                ->join('months as m', 'm.id', '=', 'd.month_id')
                ->join('schedulers as s', 's.days_id', '=', 'd.id')
                ->where('year_id', $request->year_id)
                ->groupBy('m.month')
                ->select('m.month','m.id as month_id')->get();
    }

    public function status($days)
    {
        $scheduler = DB::table('schedulers as s')
                    ->where('s.days_id', $days)
                    ->select('status')
                    ->first();
         return $scheduler;
    }




}
