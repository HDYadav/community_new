<?php

namespace App\Repository;
 
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\DB; 

 

class TaskRepository
{  

    public function getTask()
    {
        $users = DB::table('tasks as t')
            ->join('users as u', 'u.id', '=', 't.message_giver_id')               
            ->join('users as u3', 'u3.id', '=', 't.care_taker_id') 
            ->join('users as u4', 'u4.id', '=', 't.assigned_by')
            ->where('t.message_giver_id', auth()->user()->id)    
            ->select('t.care_taker_id as id', 'u3.name as care_taker','u4.name as created_by','t.task_start_date','t.task_end_date','t.subject','t.message'); 

        return $users->get();
    }

    public function getUsers(Request $request, $careTakerId)
    {
        $users = DB::table('users as u')
            ->join('model_has_roles as mhr', 'mhr.model_id', '=', 'u.id')
            ->join('roles as r', 'r.id', '=', 'mhr.role_id')
            ->where('u.parent_id',$careTakerId)
            ->select('u.id', 'u.parent_id', 'u.name', 'u.mobile', 'r.name as role');

        // if (Auth::user()->id != $this->superAdmin) {
        //     $users->where('u.parent_id', Auth::user()->id);
        // }

        return $users->get();
    }


}
