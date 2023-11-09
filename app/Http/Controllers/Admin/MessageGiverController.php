<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Repository\MessageGiverRepository;
use App\Http\Requests\MessageGiverRequest; 

class MessageGiverController extends Controller
{

    private static $messageGiver='3';
    private static $careTaker='4';

    public function index(Request $request, MessageGiverRepository $messageRepository)
    { 
        if ($request->ajax()) { 
         
          $users = $messageRepository->getTask($request); 
          
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('action', function ($row) { 
                    return $row;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.message_giver.index');
    }

    public function create(MessageGiverRepository $messageRepository)
    {
        $message_givers = $messageRepository->getMessageGivers(self::$messageGiver); 
        $careTakers = $messageRepository->getMessageGivers(self::$careTaker);  

        return view('admin.message_giver.create',compact('message_givers','careTakers'));
    }


    public function store(MessageGiverRequest $request, MessageGiverRepository $messageRepository)
    {  
        try {
            DB::beginTransaction(); 
            $messageRepository->create($request);
            DB::commit(); 
            return response()->json(['data' =>'true']);           
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        }
    }



}
