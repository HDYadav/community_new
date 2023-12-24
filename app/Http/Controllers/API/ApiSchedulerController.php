<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
 use App\Http\Controllers\ApiController;
use App\Http\Requests\MonthRequest;
use App\Http\Requests\SaveSchedulerRequest;
use Illuminate\Http\Request;
use App\Repository\SchedulerRepository;
use App\Models\Scheduler;

class ApiSchedulerController extends ApiController
{
    public function index(SchedulerRepository $schedulerRepository)
    {

        $years = $schedulerRepository->getYears();
        $cities = $schedulerRepository->getCities();
        $users =  $schedulerRepository->getUsers(); 
    }


    public function getYears(SchedulerRepository $schedulerRepository){
        $years = $schedulerRepository->getYears();
        return $this->sucessResponse('Records sucessfully fetch', $years, true, 201);
    }

    public function getcities(SchedulerRepository $schedulerRepository)
    {
        $cities = $schedulerRepository->getCities();
        return $this->sucessResponse('Records sucessfully fetch', $cities, true, 201);
    }

    public function getUsers(SchedulerRepository $schedulerRepository)
    {
        $users =  $schedulerRepository->getUsers();
        return $this->sucessResponse('Records sucessfully fetch', $users, true, 201);
    }


    public function getMonths(MonthRequest $request, SchedulerRepository $schedulerRepository)
    {
         
        $months =  $schedulerRepository->getAllMonths($request);
        return $this->sucessResponse('Records sucessfully fetch', $months, true, 201);
    }


    public function getAllMDays(MonthRequest $request, SchedulerRepository $schedulerRepository)
    {
        try { 

            $days = $schedulerRepository->getAllDaysByMonth($request->month_id, $request->year_id);

            $years = $schedulerRepository->getYears();
            $cities = $schedulerRepository->getCities();
            $users =  $schedulerRepository->getUsers();

            $status = $schedulerRepository->status(@$days['0']->id);

            $monthId = $request->month_id;
            $yearId = $request->year_id;

            $allDays = ['days'=>$days, 'years' =>$years, 'cities' =>$cities, 'users' =>$users, 'status' =>$status, 'monthId' =>$monthId, 'yearId' => $yearId];

            return $this->sucessResponse('Records sucessfully fetch', $allDays, true, 201); 
 
        } catch (\Exception $exe) {
            return response()->json(['status' => false, 'message' => $exe->getMessage()]);
        }
    }



    public function schUpdate(SaveSchedulerRequest $request, SchedulerRepository $schedulerRepository)
    {
    

       // dd($request);
        // Remove the data before update
        $collection = $schedulerRepository->getAllDaysByMonth($request->month_id, $request->year);
        foreach ($collection as $days) {
            Scheduler::where('days_id', $days->id)->delete();
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

        return back()->with('sucess', 'Records have been updated successfully!');
    }





}
