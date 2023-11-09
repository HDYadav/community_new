<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\Repository\CityRepository;
use Yajra\DataTables\DataTables;
use Illuminate\Support\Facades\DB;
use App\Http\Requests\CityRequest;
use App\Models\City;
use App\Http\Requests\CityUpdateRequest;

class CityController extends Controller
{
    public function index(Request $request, CityRepository $CityRepository)
    {
    
        if ($request->ajax()) {

            $users = $CityRepository->getCity($request);
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon=asset("admin/assets/images/icon/edit-8-64.png"); 
                    $del_icon=asset("admin/assets/images/icon/delete-icon.png");
                    $btn = "<a class='edit btn btn-sm' href='city/$row->id/edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->id)'><img src=$del_icon height='25%' width='25%'  ></a>";
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.city.index');
    }

    public function create(CityRepository $CityRepository)
    { 
        return view('admin.city.create');
    }

    public function store(CityRequest $request, CityRepository $cityRepository)
    {  
           
        try {
            DB::beginTransaction(); 
           $cityRepository->create($request);
            
            DB::commit(); 
            return response()->json(['data' =>'true']);            
        } catch (\Exception $e) {
            DB::rollBack();
            return response()->json(['errors' => $e->getMessage()]);
        }
    }

    public function edit(City $city, CityRepository  $CityRepository)
        {  
           
        return view('admin.city.edit', [
            'cities' => $city,           
        ]);

      }

       public function update(CityUpdateRequest $request, CityRepository $cityRepository)
        {   
            try {
                DB::beginTransaction(); 
            
                $user = $cityRepository->update($request);
                DB::commit(); 
            return response()->json(['data' =>'true']);
            
            } catch (\Exception $e) {
                DB::rollBack();
                return response()->json(['errors' => $e->getMessage()]);
            } 

        }

        public function delete(Request $request)
        {

        try {
            $input = $request->all();

            $input = request()->except(['_token']);

            DB::table('cities')->where('id', $input['id'])->delete();
            
            $msg = 'City successfully deleted';
            return ['status' => true, 'message' => $msg];
        } catch (\Exception $exe) {
            return ['status' => 'false', 'message' => $exe->getMessage()];
        }
    }





}
