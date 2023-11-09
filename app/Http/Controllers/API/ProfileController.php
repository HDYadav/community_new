<?php

namespace App\Http\Controllers\Api;
use App\Http\Controllers\ApiController;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Helpers\UserData;


class ProfileController extends ApiController
{
    
    public function index(Request $request){ 
        
        $userdata = UserData::getUserFrToken($request);
        return $this->sucessResponse('Records sucessfully fetch', $userdata, true, 201);
    }
}
