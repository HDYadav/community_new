<?php

namespace App\Repository;

use App\Contracts\UserRepositoryInterface;
use App\Models\City;
use Carbon\Carbon;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Str;


class CityRepository implements UserRepositoryInterface
{ 
    public function getCity(Request $request)
    {
        $users = DB::table('cities')            
            ->select('id', 'name'); 
        return $users->get();
    }

    public function create($request)
    { 
        return City::create([            
            'name' => $request->name           
        ]);
        
    }

     
public function update($request){

      return City::where('id', $request->id)
       ->update([
           'name' => $request->name        
        ]); 

    }



}
