<?php

namespace App\Http\Controllers\Admin;

use App\Http\Controllers\Controller;
use App\Repository\YearRepository;
use Illuminate\Http\Request;
use Yajra\DataTables\DataTables;
use App\Http\Requests\YearRequest;
use App\Http\Requests\YearUpdateRequest;
use App\Models\Year;
use Illuminate\Support\Facades\DB;

class YearController extends Controller
{
    /**
     * Display a listing of the resource.
     */
    public function index(Request $request, YearRepository $yearRepository)
    {
        if ($request->ajax()) {

            $users = $yearRepository->getYears($request);
            return Datatables::of($users)
                ->addIndexColumn()
                ->addColumn('action', function ($row) {
                    $edit_icon = asset("admin/assets/images/icon/edit-8-64.png");
                    $del_icon = asset("admin/assets/images/icon/delete-icon.png");
                    $btn = "<a class='edit btn btn-sm' href='years/$row->id/edit'><img src=$edit_icon height='25%' width='25%'></a>   <a alt='Delete' onclick='deletess($row->id)'><img src=$del_icon height='25%' width='25%'  ></a>";
                    return $btn;
                })
                ->rawColumns(['action'])
                ->make(true);
        }

        return view('admin.years.index');
    }

    /**
     * Show the form for creating a new resource.
     */
    public function create()
    {
        return view('admin.years.create');
    }

    /**
     * Store a newly created resource in storage.
     */
    public function store(YearRequest $request, YearRepository $yearRepository)
    {
        try {
            DB::beginTransaction();
            $yearRepository->create($request);

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
    public function edit(Year $year, YearRepository $yearRepository)
    {

        return view('admin.years.edit', [
            'years' => $year,
        ]);
    }

    /**
     * Update the specified resource in storage.
     */
    public function update(YearUpdateRequest $request, YearRepository $yearRepository)
    {
        try {
            DB::beginTransaction();

           

            $user = $yearRepository->update($request);
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

            DB::table('years')->where('id', $input['id'])->delete();

            $msg = 'Year successfully deleted';
            return ['status' => true, 'message' => $msg];
        } catch (\Exception $exe) {
            return ['status' => 'false', 'message' => $exe->getMessage()];
        }
    }
}
