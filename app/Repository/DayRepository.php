<?php

namespace App\Repository; 

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Year;
use App\Models\Day;
 


class DayRepository 
{ 
    public function getYears(Request $request)
    {
        $users = DB::table('years')            
            ->select('id', 'year'); 
        return $users->get();
    }

    public function create($request)
    { 
        return Year::create([            
            'year' => $request->year           
        ]);
        
    }

    public function store_days($request)
    {
        
       $date= self::convertDateFromYearIDtoMonthID($request->year_id, $request->month_id, $request->date); 
      
        return Day::create([
            'year_id' => $request->year_id,
            'month_id' => $request->month_id,
            'date' => $date,
            'day' => $request->week,            
        ]);
    }

    public static function convertDateFromYearIDtoMonthID($year_id, $month_id,$date){

        $combined[] = DB::table('years')->select('id', 'year')->where('id', $year_id)->first();
        $combined[] = DB::table('months')->select('id', 'month')->where('id', $month_id)->first();

        $date = str_pad($date, 2, '0', STR_PAD_LEFT);
        $month = str_pad($combined['1']->id, 2, '0', STR_PAD_LEFT);

       return $combined['0']->year."-". $month.'-'. $date;


    }


     
public function update($request){
    //dd($request);

    $date = self::convertDateFromYearIDtoMonthID($request->year_id, $request->month_id, $request->date); 


      return Day::where('id', $request->dayID)
       ->update(['year_id' => $request->year_id,
            'month_id' => $request->month_id,
            'date' => $date,
            'day' => $request->week,         
        ]); 

    }


    public function getDays(Request $request)
    {
        $users = DB::table('days as d')
        ->join('years as y','y.id','=','d.year_id')
        ->join('months as m', 'm.id', '=', 'd.month_id')
        ->select('d.id', 'd.date','d.day','y.year','m.month');
        return $users->get();
    }


    public function getDropDownYears()
    {
        return DB::table('years')->select('id', 'year')->get();
    }

    public function getDropDownMonths()
    {
        return DB::table('months')->select('id', 'month')->get();
    }


    public function getEditDay($dayid)
    {
        return DB::table('days')->select('*')->where('id', $dayid)->first();
    }

    

     


}
