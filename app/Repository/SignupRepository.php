<?php

namespace App\Repository;

use App\Contracts\UserRepositoryInterface;
use App\Models\User; 
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\DB; 
use Illuminate\Support\Facades\Auth;
use App\Models\UserDetail;
use Illuminate\Support\Str;

class SignupRepository implements UserRepositoryInterface
{ 


    private static $role_id = 7;  // role id 7 is for memeber 
    
    public function create($request)
    {

        
        $user =  User::create([           
            'name' => $request->full_name,
            'email' => $request->email,
            'mobile' => $request->mobile,
            'user_name' => $request->mobile,
            'real_password' => Str::random(),
            'password' => Hash::make('12345678'),
        ]);

        UserDetail::create([
            'user_id' =>$user->id,
            'sub_congregation_id' =>$request->sub_congregation_id,
            'sub_congregation_caretaker_id' =>$request->sub_congregation_caretaker_id,
            'consecration_date' =>$request->consecration_date,
            'upload_consecration_certificate' =>$request->upload_consecration_certificate,
            'date_of_birth' =>$request->date_of_birth,
            'gender' => $request->gender,
            'zip_code' => $request->zip_code,
            'state' =>$request->state,
            'city' =>$request->city,
            'address' =>$request->address         
        ]);

        $user->assignRole([self::$role_id]); // assign the role of registerd user

        return $user;
    }



     
}
