<?php

namespace App\Repository; 

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\Year;
 


class YearRepository 
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

     
public function update($request){

      return Year::where('id', $request->id)
       ->update([
           'year' => $request->year        
        ]); 

    }



}
