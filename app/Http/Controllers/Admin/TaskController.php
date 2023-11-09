<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Repository\TaskRepository;
use App\Repository\UserRepository;

class TaskController extends Controller
{
    public function index(Request $request, TaskRepository $taskRepository)
    {  

          //  dd($taskRepository);
        if ($request->ajax()) {
          
          $tasks = $taskRepository->getTask($request);
          
            return Datatables::of($tasks)
                ->addIndexColumn()
                ->addColumn('details', function ($row) { 
                    $btn = "<a class='edit btn btn-sm' href='tasks/details/$row->id'>Show</a>";
                    return $btn;                     
                })
                ->rawColumns(['details'])
                ->make(true);
        }

        return view('admin.tasks.index');
    }


    // public function show(Request $request, TaskRepository $taskRepository)
    // {  

    //     $careTakerId = request()->segment(count(request()->segments()));
      
    //     if ($request->ajax()) {
          
    //       $tasks = $taskRepository->getTask($request);
          
    //         return Datatables::of($tasks)
    //             ->addIndexColumn()
    //             ->addColumn('details', function ($row) { 
    //                   return $row;                     
    //             })
    //             ->rawColumns(['details'])
    //             ->make(true);
    //     }

    //     return view('admin.tasks.index');
    // }


    public function show(Request $request, TaskRepository $taskRepository)
    {
          $careTakerId = request()->segment(count(request()->segments()));
          $users = $taskRepository->getUsers($request,$careTakerId);

        //   dd($users);

        // if ($request->ajax()) {

        //     $users = $taskRepository->getUsers($request,$careTakerId);
        //     return Datatables::of($users)
        //         ->addIndexColumn()
        //         ->addColumn('action', function ($row) {   
        //             return $row;
        //         })
        //         ->make(true);
        // }

        return view('admin.tasks.show',compact('users'));
    }


}
