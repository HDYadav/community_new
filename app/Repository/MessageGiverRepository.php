<?php

namespace App\Repository;

 
use Illuminate\Http\Request; 
use Illuminate\Support\Facades\DB; 
use App\Contracts\UserRepositoryInterface;
use App\Models\MessageGiver;
use Illuminate\Support\Facades\Auth;
 

class MessageGiverRepository implements UserRepositoryInterface
{   

    public function create($request)
    {
        $user =  MessageGiver::create([
            'message_giver_id' => $request->message_giver_id,
            'care_taker_id' => $request->care_taker_id,
            'subject' => $request->subject,
            'message' => $request->message,
            'task_start_date' => $request->start_date,
            'task_end_date' => $request->end_date,
            'assigned_by' => auth()->user()->id
            
        ]);
    }

    public function getMessageGivers($roleIDs)
    {
        $users = DB::table('users as u')
            ->join('model_has_roles as mhr', 'mhr.model_id', '=', 'u.id')
            ->join('roles as r', 'r.id', '=', 'mhr.role_id')
            ->where('mhr.role_id',$roleIDs)
            ->select('u.id', 'u.parent_id', 'u.name', 'u.mobile', 'r.name as role'); 

        return $users->get();
    }


    public function getTask()
    {
        $users = DB::table('tasks as t')
            ->join('users as u', 'u.id', '=', 't.message_giver_id')               
            ->join('users as u3', 'u3.id', '=', 't.care_taker_id') 
            ->join('users as u4', 'u4.id', '=', 't.assigned_by')      
            ->select('t.id',  'u.name', 'u3.name as care_taker','u4.name as created_by','t.task_start_date','t.task_end_date','t.subject','t.message'); 

        return $users->get();
    }


}
