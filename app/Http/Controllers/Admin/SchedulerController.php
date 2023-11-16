<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Repository\SchedulerRepository;
use App\Models\Scheduler;
use Yajra\DataTables\DataTables; 
use Illuminate\Support\Collection;


class SchedulerController extends Controller
{
    
    public function index(SchedulerRepository $schedulerRepository){

        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();      
        $users =  $schedulerRepository->getUsers();  

        return view('admin.schedulers.index',compact('years', 'cities'));
    }


    public function savedScheduler(SchedulerRepository $schedulerRepository)
    {

        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();
        $users =  $schedulerRepository->getUsers();

        return view('admin.schedulers.saved_scheduler', compact('years', 'cities'));
    }




    public function getMonths(Request $request, SchedulerRepository $schedulerRepository)
    {
        try {

            // DB::enableQueryLog();

            // $query = DB::getQueryLog(); 

            $collection =  $schedulerRepository->getDaysMonthYear($request);  // Function check month scheduled exists or not 
            $commaSeparatedIds = $collection->pluck('month_id')->implode(',');  // convert comman seprate array for in query 
            
            $months =  $schedulerRepository->getMonths($request, $commaSeparatedIds);  
       
           
            return response()->json(['status' => true, 'message' => 'success', 'data' => $months]);
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function getMDays(Request $request, SchedulerRepository $schedulerRepository)
    {
        try { 

            $days = $schedulerRepository->getAllDaysByMonth($request->month_id, $request->year_id); 

            $years = $schedulerRepository->getYears();
            $cities = $schedulerRepository->getCities();
            $users =  $schedulerRepository->getUsers();  
            $view = view("admin.schedulers.ajaxresponse", compact('days', 'years', 'cities', 'users'))->render();
            return response()->json(['html' => $view]);

           
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function store(Request $request, SchedulerRepository $schedulerRepository){ 

            $cityArray = $request->input('city');
            $members = $request->input('member');
            $dayIDs = $request->input('dayIDs');  

            if($request->input('save')){
                $status =  Scheduler::STATUS_PUBLISHED;
            }
            if ($request->input('draft')) {
                $status =  Scheduler::STATUS_DRAFT;
            }

 
        foreach($cityArray as $index => $city) {
 
            if(!empty($members[$index])) {

                $exists = $schedulerRepository->checkDuplicate($dayIDs[$index], $members[$index], $city);

                $scheduler = new Scheduler();
                $scheduler->days_id = $dayIDs[$index];
                $scheduler->city_id = $city;
                $scheduler->user_id = $members[$index];
                $scheduler->status = $status;
                if($exists==1){
                    $scheduler->save();
                } else{
                    return back()->with('error', 'Some Speakears is already exists!');
                 
                }             
               
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

    public function draft(Request $request, SchedulerRepository $schedulerRepository)
    {
        if ($request->ajax()) {

            $scheduler = $schedulerRepository->getSchedulesDraft($request); 
            return Datatables::of($scheduler)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon = asset("admin/assets/images/icon/edit-8-64.png");
                    $del_icon = asset("admin/assets/images/icon/delete-icon.png");
                    $btn = "<a class='edit btn btn-sm' data-toggle='modal' data-target='#myModal' id='city_id_'.$row->city_id onclick='showModal($row->city_id)' data-num='0'>View</a> <a class='edit btn btn-sm' href='$row->id/draft_edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->sid)'><img src=$del_icon height='25%' width='25%' ></a>";
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.schedulers.draft');
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
            //return $request->city_id;
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
        $allMonth =  $schedulerRepository->getMonthIdYearID($segment);   

        $days = $schedulerRepository->getAllDaysByMonth($allMonth['0']->month_id,$allMonth['0']->year_id);  

        $schedulers =  $schedulerRepository->scheduler($segment); 

        return view('admin.schedulers.edit', [
            'scheduler' => $schedulers,
            'years' => $years,
            'months' => $month,
            'cities' => $cities,
            'days' => $days
        ]);


    }

    public function update(Request $request)
    {
        if ($request->input('update')) {
            $status =  Scheduler::STATUS_PUBLISHED;
        }

        if ($request->input('draft')) {
            $status =  Scheduler::STATUS_DRAFT;
        }


        $cityArray = $request->input('city');
        $members = $request->input('member');
        $dayIDs = $request->input('dayIDs');
      

        foreach ($cityArray as $index => $city) {
            if (!empty($members[$index])) {               
                Scheduler::updateOrCreate(
                    [
                        'days_id' => $dayIDs[$index],
                        'city_id' => $city,
                        'user_id' => $members[$index],
                    ],
                    [
                        'status' => $status,
                    ]
                );
            }
        }
 

        return redirect('admin/schedulers/list');
    }



    public function draft_edit(Request $request, SchedulerRepository $schedulerRepository)
    {
        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();
        //  $users =  $schedulerRepository->getUsers();
        $month = $schedulerRepository->monthList();

        $segment = $request->segment(3);
        $allMonth =  $schedulerRepository->getMonthIdYearID($segment);

        $days = $schedulerRepository->getAllDaysByMonth($allMonth['0']->month_id, $allMonth['0']->year_id);

        $schedulers =  $schedulerRepository->scheduler($segment);

        return view('admin.schedulers.draft_edit', [
            'scheduler' => $schedulers,
            'years' => $years,
            'months' => $month,
            'cities' => $cities,
            'days' => $days
        ]);
    }

    public function draft_update(Request $request)
    {
        if ($request->input('update')) {
            $status =  Scheduler::STATUS_PUBLISHED;
        }

        if ($request->input('draft')) {
            $status =  Scheduler::STATUS_DRAFT;
        }


        $cityArray = $request->input('city');
        $members = $request->input('member');
        $dayIDs = $request->input('dayIDs'); 

       // dd($members);

        foreach ($cityArray as $index => $city) {
            if (!empty($members[$index])) {
                Scheduler::updateOrCreate(
                    [
                        'days_id' => $dayIDs[$index],
                        'city_id' => $city,
                        'user_id' => $members[$index],
                    ],
                    [
                        'status' => $status,
                    ]
                );
            }
        }


        return redirect('admin/schedulers/draft');
    }



    public function getAllMonths(Request $request, SchedulerRepository $schedulerRepository)
    {
        try { 

            $months =  $schedulerRepository->getAllMonths($request);


            return response()->json(['status' => true, 'message' => 'success', 'data' => $months]);
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }

    public function getAllMDays(Request $request, SchedulerRepository $schedulerRepository)
    {
        try { 

            $days = $schedulerRepository->getAllDaysByMonth($request->month_id, $request->year_id);

            $years = $schedulerRepository->getYears();
            $cities = $schedulerRepository->getCities();
            $users =  $schedulerRepository->getUsers();

            $status = $schedulerRepository->status($days['0']->id); 
            


            $view = view("admin.schedulers.saved_sche_ajaxresponse", compact('days', 'years', 'cities', 'users', 'status'))->render();
            return response()->json(['html' => $view]);
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }


    public function schUpdate(Request $request, SchedulerRepository $schedulerRepository)
    {

        $collection = $schedulerRepository->getAllDaysByMonth($request->m_id, $request->year);  
        foreach($collection as $days){
            $del =   Scheduler::where('days_id', $days->id)->delete();
        } 
       

        $cityArray = $request->input('city');
        $members = $request->input('member');
        $dayIDs = $request->input('dayIDs');

        if ($request->input('update')) {
            $status =  Scheduler::STATUS_PUBLISHED;
        }
        if ($request->input('draft')) {
            $status =  Scheduler::STATUS_DRAFT;
        }


        foreach ($cityArray as $index => $city) {

            if (!empty($members[$index])) { 

                $scheduler = new Scheduler();
                $scheduler->days_id = $dayIDs[$index];
                $scheduler->city_id = $city;
                $scheduler->user_id = $members[$index];
                $scheduler->status = $status;
                $scheduler->save();
                 
            }
        }

        return back()->with('sucess', 'Records sucessfylly updated!'); 
    
      
    }




}
