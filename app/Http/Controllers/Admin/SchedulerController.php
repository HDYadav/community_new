<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;
use App\Repository\SchedulerRepository;
use Ramsey\Collection\Collection;
use Illuminate\Support\Arr;
use App\Models\Scheduler;
use Yajra\DataTables\DataTables;
 

class SchedulerController extends Controller
{
    
    public function index(SchedulerRepository $schedulerRepository){

        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();      
        $users =  $schedulerRepository->getUsers();  

        return view('admin.schedulers.index',compact('years', 'cities'));
    }


    public function getMonths(Request $request, SchedulerRepository $schedulerRepository)
    {
        try {

            // DB::enableQueryLog();

            // $query = DB::getQueryLog(); 
            $months =  $schedulerRepository->getMonths($request);         
            
            return response()->json(['status' => true, 'message' => 'success', 'data' => $months]);
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function getMDays(Request $request, SchedulerRepository $schedulerRepository)
    {
        try { 
         // DB::enableQueryLog();
            $days = DB::table('days as d')
            ->join('months as m', 'm.id', '=', 'd.month_id')
            ->where('d.month_id', $request->month_id)
            ->where('d.year_id', $request->year_id)
            ->select('d.id', DB::raw('DATE_FORMAT(d.date, "%d-%b-%Y") as date') ) 
            ->get();

            $years = $schedulerRepository->getYears();
            $cities = $schedulerRepository->getCities();
            $users =  $schedulerRepository->getUsers(); 


            $view = view("admin.schedulers.ajaxresponse", compact('days', 'years', 'cities', 'users'))->render();
            return response()->json(['html' => $view]);

           // return response()->json(['status' => true, 'message' => 'success', 'data' => $days]);
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function store(Request $request){ 

        $cityArray = $request->input('city');
        $members = $request->input('member');
        $dayIDs = $request->input('dayIDs');
 
        foreach($cityArray as $index => $city) {
 
            if(!empty($members[$index])) {
                $scheduler = new Scheduler();
                $scheduler->days_id = $dayIDs[$index];
                $scheduler->city_id = $city;
                $scheduler->user_id = $members[$index];               
                $scheduler->save();
            } 
        }

        return redirect('admin/schedulers/list');

    }


    public function show(Request $request, SchedulerRepository $schedulerRepository)
    { 
        if ($request->ajax()) {

            $scheduler = $schedulerRepository->getSchedules($request);
            return Datatables::of($scheduler)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon = asset("admin/assets/images/icon/edit-8-64.png");
                    $del_icon = asset("admin/assets/images/icon/delete-icon.png");
                    $btn = "<a class='edit btn btn-sm' data-toggle='modal' data-target='#myModal' id='city_id_'.$row->city_id onclick='showModal($row->city_id)' data-num='0'>View</a> <a class='edit btn btn-sm' href='$row->id/edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->sid)'><img src=$del_icon height='25%' width='25%' ></a>";
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.schedulers.list');
    }


    public function delete(Request $request)
    {

        try {
            $input = $request->all();

            $input = request()->except(['_token']); 
            
            DB::table('schedulers')->where('id', $input['id'])->delete();

            $msg = 'Scheduler successfully deleted';
            return ['status' => true, 'message' => $msg];
        } catch (\Exception $exe) {
            return ['status' => 'false', 'message' => $exe->getMessage()];
        }
    }



    public function getCityModel(Request $request, SchedulerRepository $schedulerRepository)
    {
        try {
            // DB::enableQueryLog();
            $members = DB::table('users as u')
                ->join('cities as c', 'c.id', '=', 'u.location_id')                
                ->where('u.location_id', $request->city_id)               
                ->select('u.name','u.mobile', 'u.address')
                ->get();
                //dd($members);

            $view = view("admin.schedulers.members_ajax", compact('members'))->render();
            return response()->json(['html' => $view]); 

        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function edit(Request $request, SchedulerRepository $schedulerRepository)
    {  
        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();
      //  $users =  $schedulerRepository->getUsers();
        $month = $schedulerRepository->monthList();

        $segment = $request->segment(3);
        $schedulers =  $schedulerRepository->scheduler($segment); 

     //   dd($schedulers);

       // return view('admin.schedulers.edit', compact('years', 'cities'));

        return view('admin.schedulers.edit', [
            'scheduler' => $schedulers,
            'years' => $years,
            'months' => $month,
            'cities' => $cities, 
        ]);


    }

    public function update(Request $request)
    {
       // dd($request->dayIDs);
        DB::table('schedulers')->where('days_id', $request->dayIDs)->delete();

        $cityArray = $request->input('city');
        $members = $request->input('member');
        $dayIDs = $request->input('dayIDs');

        foreach ($cityArray as $index => $city) {

            if (!empty($members[$index])) {
                $scheduler = new Scheduler();
                $scheduler->days_id = $request->dayIDs;
                $scheduler->city_id = $city;
                $scheduler->user_id = $members[$index];
                $scheduler->save();
            }
        }

        return redirect('admin/schedulers/list');
    }


}
