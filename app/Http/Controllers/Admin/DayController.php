<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Http\Requests\DaysRequest;
use App\Repository\DayRepository;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Requests\YearRequest;
use App\Models\Day;
use App\Models\Year;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use App\Http\Requests\DaysUpdateRequest;
 

class DayController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, DayRepository $dayRepository)
    {
        if ($request->ajax()) {

            $users = $dayRepository->getDays($request);
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon = asset("admin/assets/images/icon/edit-8-64.png");
                    $del_icon = asset("admin/assets/images/icon/delete-icon.png");
                    $btn = "<a class='edit btn btn-sm' href='days/$row->id/edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->id)'><img src=$del_icon height='25%' width='25%'  ></a>";
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.days.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create(DayRepository $dayRepository)
    {
        $years = $dayRepository->getDropDownYears();
        $months = $dayRepository->getDropDownMonths();
        $date = range(1, 31);
        $weekDays = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
        ];
        

        return view('admin.days.create',compact('years', 'months', 'date', 'weekDays'));
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(DaysRequest $request, DayRepository $dayRepository)
    {
        try {
            DB::beginTransaction();
            $dayRepository->store_days($request);

            DB::commit();
            return response()->json(['data' => 'true']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        }
    }

    /**
     * Display the specified resource.
     */
    public function show(string $id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     */
    public function edit(DayRepository $dayRepository)
    { 

        $years = $dayRepository->getDropDownYears();
        $months = $dayRepository->getDropDownMonths();
        $date = range(1, 31);
        $weekDays = [
            'Sunday',
            'Monday',
            'Tuesday',
            'Wednesday',
            'Thursday',
            'Friday',
            'Saturday',
        ]; 

        $days = $dayRepository->getEditDay(request()->segment(3));   

        $dateString = $days->date;
        $date1 = Carbon::parse($dateString);
        $day_id = $date1->day; 

        return view('admin.days.edit', compact('days','years', 'months', 'date', 'weekDays', 'day_id'));



        
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(DaysUpdateRequest $request, DayRepository $dayRepository)
    {
        try {
            DB::beginTransaction();

            $user = $dayRepository->update($request);
            DB::commit();
            return response()->json(['data' => 'true']);
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        } 
    }

    /**
     * Remove the specified resource from storage.
     */
    public function delete(Request $request)
    {

        try {
            $input = $request->all();

            $input = request()->except(['_token']);

            DB::table('days')->where('id', $input['id'])->delete();

            $msg = 'Days successfully deleted';
            return ['status' => true, 'message' => $msg];
        } catch (\Exception $exe) {
            return ['status' => 'false', 'message' => $exe->getMessage()];
        }
    }

}
